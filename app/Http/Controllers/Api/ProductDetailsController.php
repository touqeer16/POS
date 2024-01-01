<?php

namespace App\Http\Controllers\Api;

use App\Business;
use App\BusinessLocation;
use App\CallNumberScheme;
use App\Contact;
use App\Http\Controllers\Controller;
use App\Media;
use App\Restaurant\ResTable;
use App\SellingPriceGroup;
use App\Transaction;
use App\TypesOfService;
use App\User;
use App\Utils\BusinessUtil;
use App\Utils\CashRegisterUtil;
use App\Utils\ContactUtil;
use App\Utils\ModuleUtil;
use App\Utils\NotificationUtil;
use App\Utils\ProductUtil;
use App\Utils\TransactionUtil;
use App\Utils\Util;
use App\Warranty;
use Carbon\Carbon;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\Routing\ResponseFactory;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
// use Salla\ZATCA\GenerateQrCode;
// use Salla\ZATCA\Tags\InvoiceDate;
// use Salla\ZATCA\Tags\InvoiceTaxAmount;
// use Salla\ZATCA\Tags\InvoiceTotalAmount;
// use Salla\ZATCA\Tags\Seller;
// use Salla\ZATCA\Tags\TaxNumber;
use Spatie\Permission\Models\Role;

class ProductDetailsController extends Controller
{
    /**
     * All Utils instance.
     */
    protected $contactUtil;
    protected $productUtil;
    protected $businessUtil;
    protected $transactionUtil;
    protected $cashRegisterUtil;
    protected $moduleUtil;
    protected $notificationUtil;
    protected $commonUtil;

    /**
     * ProductDetailsController constructor.
     * @param  ContactUtil  $contactUtil
     * @param  ProductUtil  $productUtil
     * @param  BusinessUtil  $businessUtil
     * @param  TransactionUtil  $transactionUtil
     * @param  CashRegisterUtil  $cashRegisterUtil
     * @param  ModuleUtil  $moduleUtil
     * @param  NotificationUtil  $notificationUtil
     * @param  Util  $commonUtil
     */
    public function __construct(
        ContactUtil $contactUtil,
        ProductUtil $productUtil,
        BusinessUtil $businessUtil,
        TransactionUtil $transactionUtil,
        CashRegisterUtil $cashRegisterUtil,
        ModuleUtil $moduleUtil,
        NotificationUtil $notificationUtil,
        Util $commonUtil
    ) {
        $this->contactUtil = $contactUtil;
        $this->productUtil = $productUtil;
        $this->businessUtil = $businessUtil;
        $this->transactionUtil = $transactionUtil;
        $this->cashRegisterUtil = $cashRegisterUtil;
        $this->moduleUtil = $moduleUtil;
        $this->notificationUtil = $notificationUtil;
        $this->commonUtil = $commonUtil;

        $this->dummyPaymentLine = ['method' => 'cash', 'amount' => 0, 'note' => '', 'card_transaction_number' => '', 'card_number' => '', 'card_type' => '', 'card_holder_name' => '', 'card_month' => '', 'card_year' => '', 'card_security' => '', 'cheque_number' => '', 'bank_account_number' => '',
            'is_return' => 0, 'transaction_no' => ''];
    }

    public function callNumberGeneration($business_id, $location_id, $transaction_id = null, $user_id = null)
    {
        $call_No = '';
/*         $call_Number_Scheme = CallNumberScheme::where('business_id', $business_id)->where('location_id', $location_id)->where('user_id', $user_id)->first(); */
        $call_Number_Scheme = CallNumberScheme::where('business_id', $business_id)->where('location_id', $location_id)->first();
        if (!empty($call_Number_Scheme)) {
            $start_number = $call_Number_Scheme->start_number;
            $call_number_count = $call_Number_Scheme->call_number_count;
            if ($call_number_count === 999) {
                $call_No = $start_number;
            } else {
                $call_No = $call_number_count + $start_number;
            }
            //Increment the call no count
            CallNumberScheme::where('id', $call_Number_Scheme->id)->update(['call_number_count' => $call_No]);

        } else {
            $data = array(
                array('business_id' => $business_id, 'location_id' => $location_id, 'user_id' => $user_id, 'call_number_count' => 1),
            );
            CallNumberScheme::insert($data);
            $call_No = 1;
        }
        Transaction::where('id', $transaction_id)->update(['call_no' => $call_No]);
        return $call_No;
    }

    // private function generateQrCode($businessName, $taxNumber, $invoiceDate, $invoiceTotalAmount, $invoiceTaxAmount, $transaction_id)
    // {
    //     $generatedString = GenerateQrCode::fromArray([
    //         new Seller($businessName), // seller name
    //         new TaxNumber($taxNumber), // seller tax number
    //         new InvoiceDate($invoiceDate), // invoice date as Zulu ISO8601 @see https://en.wikipedia.org/wiki/ISO_8601
    //         new InvoiceTotalAmount($invoiceTotalAmount), // invoice total amount
    //         new InvoiceTaxAmount($invoiceTaxAmount), // invoice tax amount
    //         // TODO :: Support others tags
    //     ])->toBase64();

    //     Transaction::where('id', $transaction_id)->update(['generatedBase64String' => $generatedString]);
    //     return $generatedString;
    // }

    /**
     * Returns the content for the receipt
     *
     * @param  int  $business_id
     * @param  int  $location_id
     * @param  int  $transaction_id
     * @param string $printer_type = null
     *
     * @return array
     */
    private function receiptContent($business_id, $location_id, $transaction_id, $printer_type = null, $is_package_slip = false, $from_pos_screen = true, $invoice_layout_id = null, $user_id = null)
    {
        $output = [
            //'is_enabled' => false,
            'print_type' => 'browser',
            'print' => null,
            //'printer_config' => [],
            //'data' => []
        ];

        $business_details = $this->businessUtil->getDetails($business_id);
        $location_details = BusinessLocation::find($location_id);

        if ($from_pos_screen && $location_details->print_receipt_on_invoice != 1) {
            return $output;
        }
        //Check if printing of invoice is enabled or not.
        //If enabled, get print type.

        //$output['is_enabled'] = true;

        $invoice_layout_id = !empty($invoice_layout_id) ? $invoice_layout_id : $location_details->invoice_layout_id;
        $invoice_layout = $this->businessUtil->invoiceLayout($business_id, $location_id, $invoice_layout_id);

        //Check if printer setting is provided.
        $receipt_printer_type = is_null($printer_type) ? $location_details->receipt_printer_type : $printer_type;

        $receipt_details = $this->transactionUtil->getReceiptDetails($transaction_id, $location_id, $invoice_layout, $business_details, $location_details, $receipt_printer_type);

        /* Set Call code */
        /*   $call_no = $this->callNumberGeneration($business_id, $location_id, $transaction_id, $user_id); */
        $call_no = CallNumberScheme::callNumberGeneration($business_id, $location_id, $transaction_id, $user_id);

        $receipt_details->call_no = $call_no;

        /* Set qr code */
        // When display a date from the database, convert to user timezone.
        $invoice_date = Carbon::parse($receipt_details->invoice_date)->setTimezone('Asia/Riyadh');
        $totalAmountWithoutCurrency = str_replace('﷼', '', $receipt_details->total);
        $totalTaxAmountWithoutCurrency = str_replace('﷼', '', $receipt_details->tax);
        // $generatedString = $this->generateQrCode($business_details->name, $business_details->tax_number_1, $invoice_date, $totalAmountWithoutCurrency, $totalTaxAmountWithoutCurrency, $transaction_id);
        $receipt_details->generatedBase64String = "ARPYtNin2YjYsdmF2Kcg2KfZhNmD";

        $currency_details = [
            'symbol' => $business_details->currency_symbol,
            'thousand_separator' => $business_details->thousand_separator,
            'decimal_separator' => $business_details->decimal_separator,
        ];
        $receipt_details->currency = $currency_details;

        if ($is_package_slip) {
            $output['html_content'] = view('sale_pos.receipts.packing_slip', compact('receipt_details'))->render();
            return $output;
        }

        //If print type App
        if ($receipt_printer_type == 'app') {
            $receiptData = view('sale_pos.receipts.android_app_layout', compact('receipt_details'))->render();
            $receiptUrl = getReceiptUrl($receiptData);
            $output['print_url'] = 'https://fastich.com/uploads/receipts/' . $receiptUrl;
            $output['html_content'] = $receiptData;
        }

        //If print type browser - return the content, printer - return printer config data, and invoice format config
        if ($receipt_printer_type == 'printer') {
            $output['print_type'] = 'printer';
            $output['printer_config'] = $this->businessUtil->printerConfig($business_id, $location_details->printer_id);
            $output['data'] = $receipt_details;
        } else {
            $layout = !empty($receipt_details->design) ? 'sale_pos.receipts.' . $receipt_details->design : 'sale_pos.receipts.classic';
            $output['print'] = $receipt_details;

        }

        return $output;
    }

    /**
     * @param  Request  $request
     *
     * @return Application|ResponseFactory|Response
     */
    public function getTables(Request $request)
    {
        $business_id = $request->session()->get('user.business_id');
        $location_id = $request->get('location_id');
        if (!empty($location_id)) {
            // $transaction_id = $request->get('transaction_id', null);
            //                if (!empty($transaction_id)) {
            //                    $transaction = Transaction::find($transaction_id);
            //                    $view_data = ['res_table_id' => $transaction->res_table_id,
            //                                  'res_waiter_id' => $transaction->res_waiter_id,
            //                    ];
            //                } else {
            //                    $view_data = ['res_table_id' => null, 'res_waiter_id' => null];
            //                }

            $tables_enabled = false;
            $tables = null;
            if ($this->commonUtil->isModuleEnabled('tables')) {
                $tables_enabled = true;
                $tables = ResTable::where('business_id', $business_id)
                    ->where('location_id', $location_id)
                    ->get();
            }
        } else {
            $tables = [];
            $tables_enabled = $this->commonUtil->isModuleEnabled('tables') ? true : [];
        }

        return response(['tables' => $tables, 'tables_enabled' => $tables_enabled], 200);
    }

    /**
     * @param  Request  $request
     *
     * @return Application|ResponseFactory|Response
     */
    public function getServiceStaffs(Request $request)
    {
        $business_id = $request->session()->get('user.business_id');
        $location_id = $request->get('location_id');
        if (!empty($location_id)) {
//            $transaction_id = $request->get('transaction_id', null);
            //            if (!empty($transaction_id)) {
            //                $transaction = Transaction::find($transaction_id);
            //                $view_data = ['res_table_id' => $transaction->res_table_id,
            //                              'res_waiter_id' => $transaction->res_waiter_id,
            //                ];
            //            } else {
            //                $view_data = ['res_table_id' => null, 'res_waiter_id' => null];
            //            }

            $waiters_enabled = false;
            $waiters = null;
            if ($this->commonUtil->isModuleEnabled('service_staff')) {
                $waiters_enabled = true;

                $waiters = [];
                //Get all service staff roles
                $service_staff_roles = Role::where('business_id', $business_id)
                    ->where('is_service_staff', 1)
                    ->pluck('name')
                    ->toArray();

                //Get all users of service staff roles
                if (!empty($service_staff_roles)) {
                    $waiters = User::where('business_id', $business_id)
                        ->role($service_staff_roles);

                    if (!empty($location_id)) {
                        $waiters->permission(['location.' . $location_id, 'access_all_locations']);
                    }

                    $waiters = $waiters->select('id', DB::raw('CONCAT(COALESCE(first_name, ""), " ", COALESCE(last_name, "")) as full_name'))->get();
                }
            }
        } else {
            $waiters = [];
            $waiters_enabled = $this->commonUtil->isModuleEnabled('service_staff') ? true : [];
        }

        $pos_settings = json_decode($request->session()->get('business.pos_settings'), true);

        $is_service_staff_required = (!empty($pos_settings['is_service_staff_required']) && $pos_settings['is_service_staff_required'] == 1) ? true : [];

        return response(['service_staff' => $waiters, 'service_staff_enabled' => $waiters_enabled, 'is_service_staff_required' => $is_service_staff_required], 200);
    }

    /**
     * @param  Request  $request
     *
     * @return Application|ResponseFactory|Response
     */
    public function getTypesOfServices(Request $request)
    {
        $business_id = $request->session()->get('user.business_id');
        $types_of_service = [];
        if ($this->moduleUtil->isModuleEnabled('types_of_service')) {
            $types_of_service = TypesOfService::where('business_id', $business_id)->get();
        }

        return response(['types_of_service' => $types_of_service], 200);
    }

    /**
     * @param  Request  $request
     *
     * @throws \Throwable
     *
     * @return Response
     */
    public function getTypesOfServiceDetails(Request $request)
    {
        $location_id = $request->input('location_id');
        $types_of_service_id = $request->input('types_of_service_id');

        $business_id = $request->session()->get('user.business_id');

        $types_of_service = TypesOfService::where('business_id', $business_id)
            ->where('id', $types_of_service_id)
            ->first();

        $price_group_id = !empty($types_of_service->location_price_group[$location_id])
        ? $types_of_service->location_price_group[$location_id] : '';
        $price_group_name = '';

        if (!empty($price_group_id)) {
            $price_group = SellingPriceGroup::find($price_group_id);
            $price_group_name = $price_group->name;
        }

        return response([
            'types_of_service' => $types_of_service,
            'price_group_id' => $price_group_id,
            'packing_charge' => $types_of_service->packing_charge,
            'packing_charge_type' => $types_of_service->packing_charge_type,
            'price_group_name' => $price_group_name,
        ], 200);
    }

    /**
     * @param  Request  $request
     *
     * @return Application|ResponseFactory|Response
     */
    public function storeCustomer(Request $request)
    {
        if (!auth()->user()->can('supplier.create') && !auth()->user()->can('customer.create') && !auth()->user()->can('customer.view_own') && !auth()->user()->can('supplier.view_own')) {
            return response(['errors' => 'Unauthorized action'], 422);
        }

        try {
            $business_id = $request->session()->get('user.business_id');

            $input = $request->only(['name', 'mobile']);

            if (!empty($input['dob'])) {
                $input['dob'] = $this->commonUtil->uf_date($input['dob']);
            }

            $input['business_id'] = $business_id;
            $input['created_by'] = $request->session()->get('user.id');

            $input['credit_limit'] = $request->input('credit_limit') != '' ? $this->commonUtil->num_uf($request->input('credit_limit')) : null;
            $input['type'] = 'customer';
            $input['contact_status'] = 'active';
            $input['opening_balance'] = $this->commonUtil->num_uf($request->input('opening_balance'));

            $output = $this->contactUtil->createNewContact($input);

        } catch (\Exception $e) {
            \Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());

            $output = ['success' => false,
                'msg' => __("messages.something_went_wrong"),
            ];
        }

        return response(['data' => $output], 200);
    }

    public function searchCustomer(Request $request)
    {
        $term = request()->input('search', '');

        $business_id = request()->session()->get('user.business_id');
        $user_id = request()->session()->get('user.id');

        $contacts = Contact::where('business_id', $business_id)
            ->active();

        $selected_contacts = User::isSelectedContacts($user_id);
        if ($selected_contacts) {
            $contacts->join('user_contact_access AS uca', 'contacts.id', 'uca.contact_id')
                ->where('uca.user_id', $user_id);
        }

        if (!empty($term)) {
            $contacts->where(function ($query) use ($term) {
                $query->where('name', 'like', '%' . $term . '%')
                    ->orWhere('supplier_business_name', 'like', '%' . $term . '%')
                    ->orWhere('mobile', 'like', '%' . $term . '%')
                    ->orWhere('contacts.contact_id', 'like', '%' . $term . '%');
            });
        }

        $contacts->select(
            'contacts.id',
            DB::raw("IF(contacts.contact_id IS NULL OR contacts.contact_id='', name, CONCAT(name, ' (', contacts.contact_id, ')')) AS text"),
            'mobile',
            'address_line_1',
            'city',
            'state',
            'pay_term_number',
            'pay_term_type',
            'balance',
            'supplier_business_name'
        )
            ->onlyCustomers();

        if (request()->session()->get('business.enable_rp') == 1) {
            $contacts->addSelect('total_rp');
        }
        $contacts = $contacts->get();

        return response(['contacts' => $contacts]);
    }

    /**
     * @param  Request  $request
     *
     * @return Application|ResponseFactory|Response
     */
    public function suspendedSellNote(Request $request)
    {
        // $input = $request->all();
        //        $business_id = session()->get('user.business_id');
        //        $user_id = $request->session()->get('user.id');
        //
        //        $discount = ['discount_type' => $input['discount_type'],
        //                     'discount_amount' => $input['discount_amount']
        //        ];
        //
        //        // transaction_date
        //        if (empty($request->input('transaction_date'))) {
        //            $input['transaction_date'] =  Carbon::now();
        //        } else {
        //            $input['transaction_date'] = $this->productUtil->uf_date($request->input('transaction_date'), true);
        //        }
        //
        //        //Set commission agent
        //        $input['commission_agent'] = !empty($request->input('commission_agent')) ? $request->input('commission_agent') : null;
        //        $commsn_agnt_setting = $request->session()->get('business.sales_cmsn_agnt');
        //        if ($commsn_agnt_setting == 'logged_in_user') {
        //            $input['commission_agent'] = $user_id;
        //        }
        //
        //        $invoice_total = $this->productUtil->calculateInvoiceTotal($input['products'], $input['tax_rate_id'], $discount);
        //
        //        $transaction = $this->transactionUtil->createSellTransaction($business_id, $input, $invoice_total, $user_id);
        //
        //        $this->transactionUtil->createOrUpdateSellLinesTransaction($transaction, $input['products'], $input['location_id']);
        //
        //        return response(['msg' => 'Sale added successfully'], 200);

        if (!auth()->user()->can('sell.create') && !auth()->user()->can('direct_sell.access')) {
            return response(['errors' => 'Unauthorized action'], 403);
        }

        $is_direct_sale = false;
        if (!empty($request->input('is_direct_sale'))) {
            $is_direct_sale = true;
        }

        //Check if there is a open register, if no then redirect to Create Register screen.
        if (!$is_direct_sale && $this->cashRegisterUtil->countOpenedRegister() == 0) {
            return response(['url' => 'CashRegisterController@create'], 403);
        }

        try {
            $input = $request->except('_token');
            $business_id = $request->session()->get('user.business_id');

            // Contact Id
            $contact_id = $request->get('contact_id', null);
            if ($contact_id == 'no_customer_select') {
                $contact_id = Contact::where('business_id', $business_id)->first()->id;
            }
            $input['contact_id'] = $contact_id;

            //Check Customer credit limit
            $is_credit_limit_exeeded = $this->transactionUtil->isCustomerCreditLimitExeeded($input);

            if ($is_credit_limit_exeeded !== false) {
                $credit_limit_amount = $this->transactionUtil->num_f($is_credit_limit_exeeded, true);
                $output = ['success' => 0,
                    'msg' => __('lang_v1.cutomer_credit_limit_exeeded', ['credit_limit' => $credit_limit_amount]),
                    'receipt' => null,
                ];
                if (!$is_direct_sale) {
                    return $output;
                } else {
                    return response(['url' => 'SellController@index', 'status' => $output], 403);
                }
            }

            $input['is_quotation'] = 0;
            //status is send as quotation from Add sales screen.
            if ($input['status'] == 'quotation') {
                $input['status'] = 'draft';
                $input['is_quotation'] = 1;
            }

            if (!empty($input['products'])) {

                $user_id = $request->session()->get('user.id');

                $discount = ['discount_type' => $input['discount_type'],
                    'discount_amount' => $input['discount_amount'],
                ];
                $invoice_total = $this->productUtil->calculateInvoiceTotal($input['products'], $input['tax_rate_id'], $discount);

                DB::beginTransaction();

                if (empty($request->input('transaction_date'))) {
                    $input['transaction_date'] = \Carbon::now();
                } else {
                    $input['transaction_date'] = $this->productUtil->uf_date($request->input('transaction_date'), true);
                }
                if ($is_direct_sale) {
                    $input['is_direct_sale'] = 1;
                }

                //Set commission agent
                $input['commission_agent'] = !empty($request->input('commission_agent')) ? $request->input('commission_agent') : null;
                $commsn_agnt_setting = $request->session()->get('business.sales_cmsn_agnt');
                if ($commsn_agnt_setting == 'logged_in_user') {
                    $input['commission_agent'] = $user_id;
                }

                if (isset($input['exchange_rate']) && $this->transactionUtil->num_uf($input['exchange_rate']) == 0) {
                    $input['exchange_rate'] = 1;
                }

                //Customer group details
                $cg = $this->contactUtil->getCustomerGroup($business_id, $contact_id);
                $input['customer_group_id'] = (empty($cg) || empty($cg->id)) ? null : $cg->id;

                //set selling price group id
                $price_group_id = $request->has('price_group') ? $request->input('price_group') : null;

                //If default price group for the location exists
                $price_group_id = $price_group_id == 0 && $request->has('default_price_group') ? $request->input('default_price_group') : $price_group_id;

                $input['is_suspend'] = isset($input['is_suspend']) && 1 == $input['is_suspend'] ? 1 : 0;
                if ($input['is_suspend']) {
                    $input['sale_note'] = !empty($input['additional_notes']) ? $input['additional_notes'] : null;
                }

                //Generate reference number
                if (!empty($input['is_recurring'])) {
                    //Update reference count
                    $ref_count = $this->transactionUtil->setAndGetReferenceCount('subscription');
                    $input['subscription_no'] = $this->transactionUtil->generateReferenceNumber('subscription', $ref_count);
                }

                if (!empty($request->input('invoice_scheme_id'))) {
                    $input['invoice_scheme_id'] = $request->input('invoice_scheme_id');
                }

                //Types of service
                if ($this->moduleUtil->isModuleEnabled('types_of_service')) {
                    $input['types_of_service_id'] = $request->input('types_of_service_id');
                    $price_group_id = !empty($request->input('types_of_service_price_group')) ? $request->input('types_of_service_price_group') : $price_group_id;
                    $input['packing_charge'] = !empty($request->input('packing_charge')) ?
                    $this->transactionUtil->num_uf($request->input('packing_charge')) : 0;
                    $input['packing_charge_type'] = $request->input('packing_charge_type');
                    $input['service_custom_field_1'] = !empty($request->input('service_custom_field_1')) ?
                    $request->input('service_custom_field_1') : null;
                    $input['service_custom_field_2'] = !empty($request->input('service_custom_field_2')) ?
                    $request->input('service_custom_field_2') : null;
                    $input['service_custom_field_3'] = !empty($request->input('service_custom_field_3')) ?
                    $request->input('service_custom_field_3') : null;
                    $input['service_custom_field_4'] = !empty($request->input('service_custom_field_4')) ?
                    $request->input('service_custom_field_4') : null;
                }

                $input['selling_price_group_id'] = $price_group_id;

                if ($this->transactionUtil->isModuleEnabled('tables')) {
                    $input['res_table_id'] = request()->get('res_table_id');
                }
                if ($this->transactionUtil->isModuleEnabled('service_staff')) {
                    $input['res_waiter_id'] = request()->get('res_waiter_id');
                }

                $transaction = $this->transactionUtil->createSellTransaction($business_id, $input, $invoice_total, $user_id);

                $this->transactionUtil->createOrUpdateSellLinesTransaction($transaction, $input['products'], $input['location_id']);

                if (!$is_direct_sale) {
                    //Add change return
                    $change_return = $this->dummyPaymentLine;
                    $change_return['amount'] = $input['change_return'];
                    $change_return['is_return'] = 1;
                    $input['payment'][] = $change_return;
                }

                $is_credit_sale = isset($input['is_credit_sale']) && $input['is_credit_sale'] == 1 ? true : false;

                if (!$transaction->is_suspend && !empty($input['payment']) && !$is_credit_sale) {
                    $this->transactionUtil->createOrUpdatePaymentLines($transaction, $input['payment']);
                }

                //Check for final and do some processing.
                if ($input['status'] == 'final') {
                    //update product stock
                    foreach ($input['products'] as $product) {
                        $decrease_qty = $this->productUtil
                            ->num_uf($product['quantity']);
                        if (!empty($product['base_unit_multiplier'])) {
                            $decrease_qty = $decrease_qty * $product['base_unit_multiplier'];
                        }

                        if ($product['enable_stock']) {
                            $this->productUtil->decreaseProductQuantity(
                                $product['product_id'],
                                $product['variation_id'],
                                $input['location_id'],
                                $decrease_qty
                            );
                        }

                        if ($product['product_type'] == 'combo') {
                            //Decrease quantity of combo as well.
                            $this->productUtil
                                ->decreaseProductQuantityCombo(
                                    $product['combo'],
                                    $input['location_id']
                                );
                        }
                    }

                    //Add payments to Cash Register
                    if (!$is_direct_sale && !$transaction->is_suspend && !empty($input['payment']) && !$is_credit_sale) {
                        $this->cashRegisterUtil->addSellPayments($transaction, $input['payment']);
                    }

                    //Update payment status
                    $this->transactionUtil->updatePaymentStatus($transaction->id, $transaction->final_total);

                    if ($request->session()->get('business.enable_rp') == 1) {
                        $redeemed = !empty($input['rp_redeemed']) ? $input['rp_redeemed'] : 0;
                        $this->transactionUtil->updateCustomerRewardPoints($contact_id, $transaction->rp_earned, 0, $redeemed);
                    }

                    //Allocate the quantity from purchase and add mapping of
                    //purchase & sell lines in
                    //transaction_sell_lines_purchase_lines table
                    $business_details = $this->businessUtil->getDetails($business_id);
                    $pos_settings = empty($business_details->pos_settings) ? $this->businessUtil->defaultPosSettings() : json_decode($business_details->pos_settings, true);

                    $business = ['id' => $business_id,
                        'accounting_method' => $request->session()->get('business.accounting_method'),
                        'location_id' => $input['location_id'],
                        'pos_settings' => $pos_settings,
                    ];
                    $this->transactionUtil->mapPurchaseSell($business, $transaction->sell_lines, 'purchase');

                    //Auto send notification
                    $this->notificationUtil->autoSendNotification($business_id, 'new_sale', $transaction, $transaction->contact);
                }

                //Set Module fields
                if (!empty($input['has_module_data'])) {
                    $this->moduleUtil->getModuleData('after_sale_saved', ['transaction' => $transaction, 'input' => $input]);
                }

                Media::uploadMedia($business_id, $transaction, $request, 'documents');

                activity()
                    ->performedOn($transaction)
                    ->log('added');

                DB::commit();

                if ($request->input('is_save_and_print') == 1) {
                    $url = $this->transactionUtil->getInvoiceUrl($transaction->id, $business_id);
                    return response(['url' => $url . '?print_on_load=true'], 200);
                }

                $msg = trans("sale.pos_sale_added");
                $receipt = '';
                $invoice_layout_id = $request->input('invoice_layout_id');
                $print_invoice = false;
                if (!$is_direct_sale) {
                    if ($input['status'] == 'draft') {
                        $msg = trans("sale.draft_added");

                        if ($input['is_quotation'] == 1) {
                            $msg = trans("lang_v1.quotation_added");
                            $print_invoice = true;
                        }
                    } elseif ($input['status'] == 'final') {
                        $print_invoice = true;
                    }
                }

                if ($transaction->is_suspend == 1 && empty($pos_settings['print_on_suspend'])) {
                    $print_invoice = false;
                }

                if ($print_invoice) {
                    //$receipt = $this->receiptContent($business_id, $input['location_id'], $transaction->id, null, false, true, $invoice_layout_id);
                }

                $output = ['success' => 1, 'msg' => $msg, 'receipt' => $receipt];
            } else {
                $output = ['success' => 0,
                    'msg' => trans("messages.something_went_wrong"),
                ];
            }
        } catch (\Exception $e) {
            DB::rollBack();
            \Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
            $msg = $e->getMessage();

            if (get_class($e) == \App\Exceptions\PurchaseSellMismatch::class) {
                $msg = $e->getMessage();
            }

            $output = ['success' => 0,
                'msg' => $msg,
            ];
        }

        if (!$is_direct_sale) {
            return response($output);
        } else {
            if ($input['status'] == 'draft') {
                if (isset($input['is_quotation']) && $input['is_quotation'] == 1) {
                    return response(['status' => $output, 'url' => 'SellController@getQuotations']);
                } else {
                    return response(['status' => $output, 'url' => 'SellController@getDrafts']);
                }
            } elseif ($input['status'] == 'quotation') {
                return response(['status' => $output, 'url' => 'SellController@getQuotations']);
            } else {
                if (!empty($input['sub_type']) && $input['sub_type'] == 'repair') {
                    $redirect_url = $input['print_label'] == 1 ? action('\Modules\Repair\Http\Controllers\RepairController@printLabel', [$transaction->id]) : action('\Modules\Repair\Http\Controllers\RepairController@index');
                    return response(['status' => $output, 'url' => $redirect_url]);
                }
                return response(['status' => $output, 'url' => 'SellController@index']);
            }
        }
    }

    /**
     * @param  Request  $request
     *
     * @return Application|ResponseFactory|Response
     */
    public function getRecentTransactions(Request $request)
    {
        $business_id = $request->session()->get('user.business_id');
        $user_id = $request->session()->get('user.id');
        $transaction_status = $request->get('status');
        /*  ->whereBetween('transactions.created_at', [$dateFrom, $dateTo]) */

        $register = $this->cashRegisterUtil->getCurrentCashRegister($user_id);
        if (!empty($register)) {
            $created_date = $register->created_at;
        } else {
            $created_date = Carbon::today()->toDateString() . ' 12:00:00';
        }
        /*  $created_date = "2023-11-06 00:00:00"; */
        $dateFrom = Carbon::yesterday()->toDateString() . ' 12:00:00';
        $dateTo = Carbon::today()->toDateString() . ' 11:59:00';
        $query = Transaction::where('business_id', $business_id)
            ->where('transactions.created_by', $user_id)
            ->where('transactions.created_at', '>=', $created_date)
            ->where('transactions.type', 'sell')
            ->where('is_direct_sale', 0);

        if ($transaction_status == 'quotation') {
            $query->where('transactions.status', 'draft')
                ->where('is_quotation', 1);
        } elseif ($transaction_status == 'draft') {
            $query->where('transactions.status', 'draft')
                ->where('is_quotation', 0);
        } else {
            $query->where('transactions.status', $transaction_status);
        }

        $transaction_sub_type = $request->get('transaction_sub_type');
        if (!empty($transaction_sub_type)) {
            $query->where('transactions.sub_type', $transaction_sub_type);
        } else {
            $query->where('transactions.sub_type', null);
        }

        $transactions = $query->orderBy('transactions.created_at', 'desc')
            ->groupBy('transactions.id')
            ->select('transactions.*')
            ->with(['contact', 'table', 'location'])
            ->limit(200)
            ->get();

        $printer_type = 'browser';
        $business_details = $this->businessUtil->getDetails($business_id);
        $sql = $query->toSql();
        $bindings = $query->getBindings();

        $print = [];
        foreach ($transactions as $transaction) {
            $location_details = BusinessLocation::find($transaction->location_id);
            $invoice_layout_id = !empty($invoice_layout_id) ? $invoice_layout_id : $location_details->invoice_layout_id;
            $invoice_layout = $this->businessUtil->invoiceLayout($business_id, $transaction->location_id, $invoice_layout_id);

            $receipt_printer_type = is_null($printer_type) ? $location_details->receipt_printer_type : $printer_type;

            $transaction['print'] = $this->transactionUtil->getReceiptDetails($transaction->id, $transaction->location_id, $invoice_layout, $business_details, $location_details, $receipt_printer_type);
            $transaction['print']->call_no = $transaction->call_no;
            $transaction['print']->generatedBase64String = $transaction->generatedBase64String;
        }

        $response = response(['transactions' => $transactions, 'transaction_sub_type' => $transaction_sub_type, 'query' => $sql, 'bindings' => $bindings, 'register' => $register], 200);
        // $ProductDetails_Controller = new PrintController;
        // $transactions = $ProductDetails_Controller->printhtml($transactions);

        return $response;
    }

    /**
     * @param  Request  $request
     *
     * @return Application|ResponseFactory|Response
     */
    public function recentTransactionDelete(Request $request)
    {
        if (!auth()->user()->can('sell.delete')) {
            return response(['errors' => 'Unauthorized action'], 403);
        }
        $transaction_id = $request->get('transaction_id');

        //Check if the transaction can be edited or not.
        $edit_days = request()->session()->get('business.transaction_edit_days');
        if (!$this->transactionUtil->canBeEdited($transaction_id, $edit_days)) {
            return response([
                'success' => 0, 'msg' => __('messages.transaction_deleted_not_allowed', ['days' => $edit_days]),
            ], 422);
        }

        try {
            $business_id = request()->session()->get('user.business_id');
            //Begin transaction
            DB::beginTransaction();

            $output = $this->transactionUtil->deleteSale($business_id, $transaction_id);

            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            \Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());

            $output['success'] = false;
            $output['msg'] = trans("messages.something_went_wrong");
        }

        return response($output);
    }

    /**
     * @param  Request  $request
     *
     * @return Application|ResponseFactory|Response
     */
    public function productDraft(Request $request)
    {
        $input = $request->all();
        $business_id = $request->session()->get('user.business_id');
        $user_id = $request->session()->get('user.id');

        $discount = ['discount_type' => $input['discount_type'],
            'discount_amount' => $input['discount_amount'],
        ];

        $invoice_total = $this->productUtil->calculateInvoiceTotal($input['products'], $input['tax_rate_id'], $discount);

        $transaction = $this->transactionUtil->createSellTransaction($business_id, $input, $invoice_total, $user_id);

        $this->transactionUtil->createOrUpdateSellLinesTransaction($transaction, $input['products'], $input['location_id']);

        return response(['success' => 'Draft Successfully'], 200);
    }

    /**
     * @param  Request  $request
     *
     * @return array|Application|ResponseFactory|Response
     */
    public function finalizePayment(Request $request)
    {
        if (!auth()->user()->can('sell.create') && !auth()->user()->can('direct_sell.access')) {
            return response(['errors' => 'Unauthorized action'], 403);
        }

        $is_direct_sale = false;
        if (!empty($request->input('is_direct_sale'))) {
            $is_direct_sale = true;
        }

        //Check if there is a open register, if no then redirect to Create Register screen.
        if (!$is_direct_sale && $this->cashRegisterUtil->countOpenedRegister() == 0) {
            return response(['url' => 'CashRegisterController@create'], 403);
        }

        try {
            $input = $request->except('_token');
            $business_id = $request->session()->get('user.business_id');

            // Contact Id
            $contact_id = $request->get('contact_id', null);
            if ($contact_id == 'no_customer_select') {
                $contact_id = Contact::where('business_id', $business_id)->first()->id;
            }
            $input['contact_id'] = $contact_id;

            //Check Customer credit limit
            $is_credit_limit_exeeded = $this->transactionUtil->isCustomerCreditLimitExeeded($input);

            if ($is_credit_limit_exeeded !== false) {
                $credit_limit_amount = $this->transactionUtil->num_f($is_credit_limit_exeeded, true);
                $output = ['success' => 0,
                    'msg' => __('lang_v1.cutomer_credit_limit_exeeded', ['credit_limit' => $credit_limit_amount]),
                    'receipt' => null,
                ];
                if (!$is_direct_sale) {
                    return $output;
                } else {
                    return response(['url' => 'SellController@index', 'status' => $output], 403);
                }
            }

            $input['is_quotation'] = 0;
            //status is send as quotation from Add sales screen.
            if ($input['status'] == 'quotation') {
                $input['status'] = 'draft';
                $input['is_quotation'] = 1;
            }

            if (!empty($input['products'])) {

                $user_id = $request->session()->get('user.id');

                $discount = ['discount_type' => $input['discount_type'],
                    'discount_amount' => $input['discount_amount'],
                ];
                $invoice_total = $this->productUtil->calculateInvoiceTotal($input['products'], $input['tax_rate_id'], $discount);

                DB::beginTransaction();

                if (empty($request->input('transaction_date'))) {
                    $input['transaction_date'] = \Carbon::now();
                } else {
                    $input['transaction_date'] = $this->productUtil->uf_date($request->input('transaction_date'), true);
                }
                if ($is_direct_sale) {
                    $input['is_direct_sale'] = 1;
                }

                //Set commission agent
                $input['commission_agent'] = !empty($request->input('commission_agent')) ? $request->input('commission_agent') : null;
                $commsn_agnt_setting = $request->session()->get('business.sales_cmsn_agnt');
                if ($commsn_agnt_setting == 'logged_in_user') {
                    $input['commission_agent'] = $user_id;
                }

                if (isset($input['exchange_rate']) && $this->transactionUtil->num_uf($input['exchange_rate']) == 0) {
                    $input['exchange_rate'] = 1;
                }

                //Customer group details
                $cg = $this->contactUtil->getCustomerGroup($business_id, $contact_id);
                $input['customer_group_id'] = (empty($cg) || empty($cg->id)) ? null : $cg->id;

                //set selling price group id
                $price_group_id = $request->has('price_group') ? $request->input('price_group') : null;

                //If default price group for the location exists
                $price_group_id = $price_group_id == 0 && $request->has('default_price_group') ? $request->input('default_price_group') : $price_group_id;

                $input['is_suspend'] = isset($input['is_suspend']) && 1 == $input['is_suspend'] ? 1 : 0;
                if ($input['is_suspend']) {
                    $input['sale_note'] = !empty($input['additional_notes']) ? $input['additional_notes'] : null;
                }

                //Generate reference number
                if (!empty($input['is_recurring'])) {
                    //Update reference count
                    $ref_count = $this->transactionUtil->setAndGetReferenceCount('subscription');
                    $input['subscription_no'] = $this->transactionUtil->generateReferenceNumber('subscription', $ref_count);
                }

                if (!empty($request->input('invoice_scheme_id'))) {
                    $input['invoice_scheme_id'] = $request->input('invoice_scheme_id');
                }

                //Types of service
                if ($this->moduleUtil->isModuleEnabled('types_of_service')) {
                    $input['types_of_service_id'] = $request->input('types_of_service_id');
                    $price_group_id = !empty($request->input('types_of_service_price_group')) ? $request->input('types_of_service_price_group') : $price_group_id;
                    $input['packing_charge'] = !empty($request->input('packing_charge')) ?
                    $this->transactionUtil->num_uf($request->input('packing_charge')) : 0;
                    $input['packing_charge_type'] = $request->input('packing_charge_type');
                    $input['service_custom_field_1'] = !empty($request->input('service_custom_field_1')) ?
                    $request->input('service_custom_field_1') : null;
                    $input['service_custom_field_2'] = !empty($request->input('service_custom_field_2')) ?
                    $request->input('service_custom_field_2') : null;
                    $input['service_custom_field_3'] = !empty($request->input('service_custom_field_3')) ?
                    $request->input('service_custom_field_3') : null;
                    $input['service_custom_field_4'] = !empty($request->input('service_custom_field_4')) ?
                    $request->input('service_custom_field_4') : null;
                }

                $input['selling_price_group_id'] = $price_group_id;

                if ($this->transactionUtil->isModuleEnabled('tables')) {
                    $input['res_table_id'] = request()->get('res_table_id');
                }
                if ($this->transactionUtil->isModuleEnabled('service_staff')) {
                    $input['res_waiter_id'] = request()->get('res_waiter_id');
                }
                $input['clientCompany'] = request()->get('clientCompany') ?? "";

                $transaction = $this->transactionUtil->createSellTransaction($business_id, $input, $invoice_total, $user_id);

                $this->transactionUtil->createOrUpdateSellLinesTransaction($transaction, $input['products'], $input['location_id']);

                if (!$is_direct_sale) {
                    //Add change return
                    $change_return = $this->dummyPaymentLine;
                    $change_return['amount'] = $input['change_return'];
                    $change_return['is_return'] = 1;
                    $input['payment'][] = $change_return;
                }

                $is_credit_sale = isset($input['is_credit_sale']) && $input['is_credit_sale'] == 1 ? true : false;

                if (!$transaction->is_suspend && !empty($input['payment']) && !$is_credit_sale) {
                    $this->transactionUtil->createOrUpdatePaymentLines($transaction, $input['payment']);
                }

                //Check for final and do some processing.
                if ($input['status'] == 'final') {
                    //update product stock
                    foreach ($input['products'] as $product) {
                        $decrease_qty = $this->productUtil
                            ->num_uf($product['quantity']);
                        if (!empty($product['base_unit_multiplier'])) {
                            $decrease_qty = $decrease_qty * $product['base_unit_multiplier'];
                        }

                        if ($product['enable_stock']) {
                            $this->productUtil->decreaseProductQuantity(
                                $product['product_id'],
                                $product['variation_id'],
                                $input['location_id'],
                                $decrease_qty
                            );
                        }

                        if ($product['product_type'] == 'combo') {
                            //Decrease quantity of combo as well.
                            $this->productUtil
                                ->decreaseProductQuantityCombo(
                                    $product['combo'],
                                    $input['location_id']
                                );
                        }
                    }

                    //Add payments to Cash Register
                    if (!$is_direct_sale && !$transaction->is_suspend && !empty($input['payment']) && !$is_credit_sale) {
                        $this->cashRegisterUtil->addSellPayments($transaction, $input['payment']);
                    }

                    //Update payment status
                    $this->transactionUtil->updatePaymentStatus($transaction->id, $transaction->final_total);

                    if ($request->session()->get('business.enable_rp') == 1) {
                        $redeemed = !empty($input['rp_redeemed']) ? $input['rp_redeemed'] : 0;
                        $this->transactionUtil->updateCustomerRewardPoints($contact_id, $transaction->rp_earned, 0, $redeemed);
                    }

                    //Allocate the quantity from purchase and add mapping of
                    //purchase & sell lines in
                    //transaction_sell_lines_purchase_lines table
                    $business_details = $this->businessUtil->getDetails($business_id);
                    $pos_settings = empty($business_details->pos_settings) ? $this->businessUtil->defaultPosSettings() : json_decode($business_details->pos_settings, true);

                    $business = ['id' => $business_id,
                        'accounting_method' => $request->session()->get('business.accounting_method'),
                        'location_id' => $input['location_id'],
                        'pos_settings' => $pos_settings,
                    ];
                    $this->transactionUtil->mapPurchaseSell($business, $transaction->sell_lines, 'purchase');

                    //Auto send notification
                    $this->notificationUtil->autoSendNotification($business_id, 'new_sale', $transaction, $transaction->contact);
                }

                //Set Module fields
                if (!empty($input['has_module_data'])) {
                    $this->moduleUtil->getModuleData('after_sale_saved', ['transaction' => $transaction, 'input' => $input]);
                }

                Media::uploadMedia($business_id, $transaction, $request, 'documents');

                activity()
                    ->performedOn($transaction)
                    ->log('added');

                DB::commit();

                if ($request->input('is_save_and_print') == 1) {
                    $url = $this->transactionUtil->getInvoiceUrl($transaction->id, $business_id);
                    return response(['url' => $url . '?print_on_load=true'], 200);
                }

                $msg = trans("sale.pos_sale_added");
                $receipt = '';
                $invoice_layout_id = $request->input('invoice_layout_id');
                $print_invoice = false;
                if (!$is_direct_sale) {
                    if ($input['status'] == 'draft') {
                        $msg = trans("sale.draft_added");

                        if ($input['is_quotation'] == 1) {
                            $msg = trans("lang_v1.quotation_added");
                            $print_invoice = true;
                        }
                    } elseif ($input['status'] == 'final') {
                        $print_invoice = true;
                    }
                }

                if ($transaction->is_suspend == 1 && empty($pos_settings['print_on_suspend'])) {
                    $print_invoice = false;
                }

                if ($print_invoice) {
                    $receipt = $this->receiptContent($business_id, $input['location_id'], $transaction->id, null, false, true, $invoice_layout_id, $user_id);
                }

                $output = ['success' => 1, 'msg' => $msg, 'receipt' => $receipt];
            } else {
                $output = ['success' => 0,
                    'msg' => trans("messages.something_went_wrong"),
                    'receipt' => null,
                ];
            }
        } catch (\Exception $e) {
            DB::rollBack();
            \Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
            $msg = trans("messages.something_went_wrong");

            if (get_class($e) == \App\Exceptions\PurchaseSellMismatch::class) {
                $msg = $e->getMessage();
            }

            $output = ['success' => 0,
                'msg' => $msg,
                'receipt' => null,
            ];
        }

        if (!$is_direct_sale) {
            return response($output);
        } else {
            if ($input['status'] == 'draft') {
                if (isset($input['is_quotation']) && $input['is_quotation'] == 1) {
                    return response(['status' => $output, 'url' => 'SellController@getQuotations']);
                } else {
                    return response(['status' => $output, 'url' => 'SellController@getDrafts']);
                }
            } elseif ($input['status'] == 'quotation') {
                return response(['status' => $output, 'url' => 'SellController@getQuotations']);
            } else {
                if (!empty($input['sub_type']) && $input['sub_type'] == 'repair') {
                    $redirect_url = $input['print_label'] == 1 ? action('\Modules\Repair\Http\Controllers\RepairController@printLabel', [$transaction->id]) : action('\Modules\Repair\Http\Controllers\RepairController@index');
                    return response(['status' => $output, 'url' => $redirect_url]);
                }
                return response(['status' => $output, 'url' => 'SellController@index']);
            }
        }
    }

    /**
     * @param  Request  $request
     *
     * @return array|Application|ResponseFactory|Response
     */
    public function recentTransactionPrint(Request $request)
    {
        $transaction_id = $request->get('transaction_id');
        try {
            $output = ['success' => 0,
                'msg' => trans("messages.something_went_wrong"),
            ];

            $business_id = $request->session()->get('user.business_id');

            $transaction = Transaction::where('business_id', $business_id)
                ->where('id', $transaction_id)
                ->with(['location'])
                ->first();

            if (empty($transaction)) {
                return $output;
            }

            $printer_type = 'browser';
            if (!empty(request()->input('check_location')) && request()->input('check_location') == true) {
                $printer_type = $transaction->location->receipt_printer_type;
            }
            $business_details = $this->businessUtil->getDetails($business_id);
            $location_details = BusinessLocation::find($transaction->location_id);

            $invoice_layout_id = !empty($invoice_layout_id) ? $invoice_layout_id : $location_details->invoice_layout_id;
            $invoice_layout = $this->businessUtil->invoiceLayout($business_id, $transaction->location_id, $invoice_layout_id);

            //Check if printer setting is provided.
            $receipt_printer_type = is_null($printer_type) ? $location_details->receipt_printer_type : $printer_type;

            $receipt = $this->transactionUtil->getReceiptDetails($transaction_id, $transaction->location_id, $invoice_layout, $business_details, $location_details, $receipt_printer_type);

            if (!empty($receipt)) {
                $output = ['success' => 1, 'receipt' => $receipt];
            }
        } catch (\Exception $e) {
            \Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());

            $output = ['success' => 0,
                'msg' => trans("messages.something_went_wrong"),
            ];
        }

        return response($output);
    }

    private function __getwarranties()
    {
        $business_id = session()->get('user.business_id');
        $common_settings = session()->get('business.common_settings');
        $is_warranty_enabled = !empty($common_settings['enable_product_warranty']) ? true : false;
        $warranties = $is_warranty_enabled ? Warranty::forDropdown($business_id) : [];

        return $warranties;
    }

    /**
     * Parse the weighing barcode.
     *
     * @return array
     */
    private function __parseWeighingBarcode($scale_barcode)
    {
        $business_id = session()->get('user.business_id');

        $scale_setting = session()->get('business.weighing_scale_setting');

        $error_msg = trans("messages.something_went_wrong");

        //Check for prefix.
        if ((strlen($scale_setting['label_prefix']) == 0) || Str::startsWith($scale_barcode, $scale_setting['label_prefix'])) {
            $scale_barcode = substr($scale_barcode, strlen($scale_setting['label_prefix']));

            //Get product sku, trim left side 0
            $sku = ltrim(substr($scale_barcode, 0, $scale_setting['product_sku_length'] + 1), '0');

            //Get quantity integer
            $qty_int = substr($scale_barcode, $scale_setting['product_sku_length'] + 1, $scale_setting['qty_length'] + 1);

            //Get quantity decimal
            $qty_decimal = '0.' . substr($scale_barcode, $scale_setting['product_sku_length'] + $scale_setting['qty_length'] + 2, $scale_setting['qty_length_decimal'] + 1);

            $qty = (float) $qty_int + (float) $qty_decimal;

            //Find the variation id
            $result = $this->productUtil->filterProduct($business_id, $sku, null, false, null, [], ['sub_sku'], false, 'exact')->first();

            if (!empty($result)) {
                return ['variation_id' => $result->variation_id,
                    'qty' => $qty,
                    'success' => true,
                ];
            } else {
                $error_msg = trans("lang_v1.sku_not_match", ['sku' => $sku]);
            }
        } else {
            $error_msg = trans("lang_v1.prefix_did_not_match");
        }

        return [
            'success' => false,
            'msg' => $error_msg,
        ];
    }
}
