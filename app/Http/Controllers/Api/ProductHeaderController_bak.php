<?php

namespace App\Http\Controllers\Api;

use App\Account;
use App\Brands;
use App\BusinessLocation;
use App\CallNumberScheme;
use App\CashRegister;
use App\Category;
use App\Contact;
use App\CustomerGroup;
use App\Http\Controllers\Controller;
use App\InvoiceLayout;
use App\InvoiceScheme;
use App\Media;
use App\Product;
use App\TaxRate;
use App\Transaction;
use App\TransactionSellLine;
use App\User;
use App\Utils\BusinessUtil;
use App\Utils\CashRegisterUtil;
use App\Utils\ContactUtil;
use App\Utils\ModuleUtil;
use App\Utils\NotificationUtil;
use App\Utils\ProductUtil;
use App\Utils\TransactionUtil;
use App\Utils\Util;
use App\Variation;
use App\Warranty;
use Carbon\Carbon;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\Routing\ResponseFactory;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

// use Salla\ZATCA\GenerateQrCode;
// use Salla\ZATCA\Tags\InvoiceDate;
// use Salla\ZATCA\Tags\InvoiceTaxAmount;
// use Salla\ZATCA\Tags\InvoiceTotalAmount;
// use Salla\ZATCA\Tags\Seller;

class ProductHeaderController extends Controller
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
     * ProductHeaderController constructor.
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

        $this->dummyPaymentLine = [
            'method' => 'cash', 'amount' => 0, 'note' => '', 'card_transaction_number' => '',
            'card_number' => '', 'card_type' => '', 'card_holder_name' => '', 'card_month' => '', 'card_year' => '',
            'card_security' => '', 'cheque_number' => '', 'bank_account_number' => '',
            'is_return' => 0, 'transaction_no' => '',
        ];
    }

    private function callNumberGeneration($business_id, $location_id, $transaction_id = null, $user_id = null)
    {

        $call_No = '';
        $call_Number_Scheme = CallNumberScheme::where('business_id', $business_id)->where('location_id', $location_id)->where('user_id', $user_id)->first();
        $call_Number_Transactions = Transaction::where('id', $transaction_id)->where('business_id', $business_id)->where('location_id', $location_id)->first();
        if (!empty($call_Number_Transactions) && ($call_Number_Transactions->call_no !== null)) {
            $call_No = $call_Number_Transactions->call_no;
        } else {
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
        }

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
            //            'is_enabled' => false,
            'print_type' => 'browser',
            'print' => null,
            //                   'printer_config' => [],
            //                   'data' => []
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
        $call_no = $this->callNumberGeneration($business_id, $location_id, $transaction_id, $user_id);
        $receipt_details->call_no = $call_no;

        /* Set qr code */
        // When display a date from the database, convert to user timezone.
        $invoice_date = Carbon::parse($receipt_details->invoice_date)->setTimezone('Asia/Riyadh');
        $totalAmountWithoutCurrency = str_replace('﷼', '', $receipt_details->total);
        $totalTaxAmountWithoutCurrency = str_replace('﷼', '', $receipt_details->tax);
        // $generatedString = $this->generateQrCode($business_details->name, $business_details->tax_number_1, $invoice_date, $totalAmountWithoutCurrency, $totalTaxAmountWithoutCurrency, $transaction_id);
        // $receipt_details->generatedBase64String = $generatedString;

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
        //If print type browser - return the content, printer - return printer config data, and invoice format config
        if ($receipt_printer_type == 'printer') {
            $output['print_type'] = 'printer';
            $output['printer_config'] = $this->businessUtil->printerConfig($business_id, $location_details->printer_id);
            $output['data'] = $receipt_details;
        } else {
            $output['print'] = $receipt_details;
        }

        return $output;
    }

    /**
     * @param  Request  $request
     *
     * @return Application|ResponseFactory|Response
     */
    public function getSuspendedSells(Request $request)
    {

        if (!auth()->user()->can('sell.view') && !auth()->user()->can('sell.create') && !auth()->user()->can('direct_sell.access') && !auth()->user()->can('view_own_sell_only')) {
            return response(['errors' => 'Unauthorized action'], 422);
        }

        $business_id = request()->session()->get('user.business_id');
        $is_woocommerce = $this->moduleUtil->isModuleInstalled('Woocommerce');
        $is_tables_enabled = $this->transactionUtil->isModuleEnabled('tables');
        $is_service_staff_enabled = $this->transactionUtil->isModuleEnabled('service_staff');

        $sells = $this->transactionUtil->getListSells($business_id);

        $permitted_locations = auth()->user()->permitted_locations();
        if ($permitted_locations != 'all') {
            $sells->whereIn('transactions.location_id', $permitted_locations);
        }

        if (!auth()->user()->can('direct_sell.access') && auth()->user()->can('view_own_sell_only')) {
            $sells->where('transactions.created_by', request()->session()->get('user.id'));
        }

        if ($is_woocommerce) {
            $sells->addSelect('transactions.woocommerce_order_id');
            if (request()->only_woocommerce_sells) {
                $sells->whereNotNull('transactions.woocommerce_order_id');
            }
        }

        $only_shipments = request()->only_shipments == 'true' ? true : [];
        if ($only_shipments && auth()->user()->can('access_shipping')) {
            $sells->whereNotNull('transactions.shipping_status');
        }

        $sells->groupBy('transactions.id');

        request()->suspended = 1;
        if (!empty(request()->suspended)) {
            $transaction_sub_type = request()->get('transaction_sub_type');
            if (!empty($transaction_sub_type)) {
                $sells->where('transactions.sub_type', $transaction_sub_type);
            } else {
                $sells->where('transactions.sub_type', null);
            }

            $with = ['sell_lines'];

            if ($is_tables_enabled) {
                $with[] = 'table';
            }

            if ($is_service_staff_enabled) {
                $with[] = 'service_staff';
            }

            $sales = $sells->where('transactions.is_suspend', 1)
                ->with($with)
                ->addSelect('transactions.is_suspend', 'transactions.res_table_id', 'transactions.res_waiter_id',
                    'transactions.additional_notes')
                ->get();

            $salesIds = $sales->pluck('id')->toArray();

            return response([
                'sales' => $sales, 'is_tables_enabled' => $is_tables_enabled,
                'is_service_staff_enabled' => $is_service_staff_enabled,
                'transaction_sub_type' => $transaction_sub_type,
                'salesIds' => $salesIds,
            ], 200);
        }
    }

    /**
     * @return Application|ResponseFactory|Response
     */
    public function getRegisterDetails()
    {
        if (!auth()->user()->can('view_cash_register')) {
            return response(['errors' => 'Unauthorized action'], 422);
        }

        $business_id = request()->session()->get('user.business_id');

        $register_details = $this->cashRegisterUtil->getRegisterDetails();

        $user_id = auth()->user()->id;
        $open_time = $register_details['open_time'];
        $close_time = \Carbon::now()->toDateTimeString();

        $is_types_of_service_enabled = $this->moduleUtil->isModuleEnabled('types_of_service');

        $details = $this->cashRegisterUtil->getRegisterTransactionDetails($user_id, $open_time, $close_time,
            $is_types_of_service_enabled);

        $payment_types = $this->cashRegisterUtil->payment_types($register_details->location_id, true, $business_id);
        $register_details['close_time'] = $close_time;

        return response([
            'register_details' => $register_details, 'details' => $details, 'payment_types' => $payment_types,
            'close_time' => $close_time,
        ], 200);
    }

    /**
     * @param $id
     *
     * @return Application|ResponseFactory|Response
     */
    public function getCloseRegister($id = null)
    {
        if (!auth()->user()->can('close_cash_register')) {
            return response(['errors' => 'Unauthorized action'], 422);
        }

        $business_id = request()->session()->get('user.business_id');
        $register_details = $this->cashRegisterUtil->getRegisterDetails($id);

        $user_id = $register_details->user_id;
        $open_time = $register_details['open_time'];
        $close_time = \Carbon::now()->toDateTimeString();

        $is_types_of_service_enabled = $this->moduleUtil->isModuleEnabled('types_of_service');

        $details = $this->cashRegisterUtil->getRegisterTransactionDetails($user_id, $open_time, $close_time,
            $is_types_of_service_enabled);

        $payment_types = $this->cashRegisterUtil->payment_types($register_details->location_id, true, $business_id);
        $register_details['close_time'] = $close_time;

        return response([
            'register_details' => $register_details, 'details' => $details, 'payment_types' => $payment_types,
        ], 200);
    }

    /**
     * @param  Request  $request
     *
     * @return Application|ResponseFactory|Response
     */
    public function closeRegister(Request $request)
    {
        if (!auth()->user()->can('close_cash_register')) {
            return response(['errors' => 'Unauthorized action'], 422);
        }

        try {
            //Disable in demo
            if (config('app.env') == 'demo') {
                $output = [
                    'success' => 0,
                    'msg' => 'Feature disabled in demo!!',
                ];

                return response(['url' => action('HomeController@index'), 'status' => $output]);
            }

            $input = $request->only(['closing_amount', 'total_card_slips', 'total_cheques', 'closing_note']);
            $input['closing_amount'] = $this->cashRegisterUtil->num_uf($input['closing_amount']);
            $user_id = $request->input('user_id');
            $input['closed_at'] = \Carbon::now()->format('Y-m-d H:i:s');
            $input['status'] = 'close';

            CashRegister::where('user_id', $user_id)
                ->where('status', 'open')
                ->update($input);
            $output = [
                'success' => 1,
                'msg' => __('cash_register.close_success'),
            ];
        } catch (\Exception $e) {
            \Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
            $output = [
                'success' => 0,
                'msg' => __("messages.something_went_wrong"),
            ];
        }

        return response($output);
    }

    /**
     * @param  Request  $request
     *
     * @return Application|ResponseFactory|Response
     */
    public function deleteSuspendedSales(Request $request)
    {
        if (!auth()->user()->can('sell.delete')) {
            return response(['errors' => 'Unauthorized action'], 422);
        }
        $id = $request->get('sell_id');

        try {
            $business_id = request()->session()->get('user.business_id');
            //Begin transaction
            DB::beginTransaction();

            $output = $this->transactionUtil->deleteSale($business_id, $id);

            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            \Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());

            $output['success'] = false;
            $output['msg'] = trans("messages.something_went_wrong");
        }

        return response(['data' => $output], 200);
    }

    /**
     * @param  Request  $request
     *
     * @return Application|ResponseFactory|Response
     */
    public function deleteAllSuspendedSales(Request $request)
    {
        if (!auth()->user()->can('sell.delete')) {
            return response(['errors' => 'Unauthorized action'], 422);
        }

        try {
            $business_id = request()->session()->get('user.business_id');
            //Begin transaction
            DB::beginTransaction();

            $input = $request->all();
            $transactionIds = explode(',', $input['value']);
            foreach ($transactionIds as $item) {
                $output = $this->transactionUtil->deleteSale($business_id, $item);
            }

            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            \Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());

            $output['success'] = false;
            $output['msg'] = trans("messages.something_went_wrong");
        }

        return response(['data' => $output], 200);
    }

    /**
     * @param  Request  $request
     *
     * @return Application|ResponseFactory|Response
     */
    public function editSuspendedSales(Request $request)
    {
        $id = $request->get('transaction_id');

        $business_id = request()->session()->get('user.business_id');

        if (!(auth()->user()->can('superadmin') || auth()->user()->can('sell.update') || ($this->moduleUtil->hasThePermissionInSubscription($business_id,
            'repair_module') && auth()->user()->can('repair.update')))) {
            return response(['errors' => 'Unauthorized action'], 422);
        }

        //Check if the transaction can be edited or not.
        $edit_days = request()->session()->get('business.transaction_edit_days');
        if (!$this->transactionUtil->canBeEdited($id, $edit_days)) {
            return response([
                'success' => 0, 'msg' => __('messages.transaction_edit_not_allowed', ['days' => $edit_days]),
            ], 422);
        }

        //Check if there is a open register, if no then redirect to Create Register screen.
        if ($this->cashRegisterUtil->countOpenedRegister() == 0) {
            return response(['url' => 'CashRegisterController@create'], 200);
        }

        //Check if return exist then not allowed
        if ($this->transactionUtil->isReturnExist($id)) {
            return response(['success' => 0, 'msg' => __('lang_v1.return_exist')], 422);
        }

        $walk_in_customer = $this->contactUtil->getWalkInCustomer($business_id);

        $business_details = $this->businessUtil->getDetails($business_id);

        $allTaxDropdown = TaxRate::where('business_id', $business_id)->get();
        $quantity = request()->get('quantity', 1);

        $transaction = Transaction::where('business_id', $business_id)
            ->where('type', 'sell')
            ->with(['price_group', 'types_of_service'])
            ->findorfail($id);

        $location_id = $transaction->location_id;
        $business_location = BusinessLocation::find($location_id);
        $payment_types = $this->productUtil->payment_types($business_location, true);
        $location_printer_type = $business_location->receipt_printer_type;

        $sell_details = TransactionSellLine::with([
            'product', 'product.variations', 'product.modifier_sets.variations', 'variations', 'modifiers',
        ])->where('transaction_id', $transaction->id)->where('parent_sell_line_id', '=', null)->get();

//        $output['modifier_products'] = [];
        //        if ($this->transactionUtil->isModuleEnabled('modifiers')  && !$is_direct_sell) {
        //            $this_product = Product::where('business_id', $business_id)
        //                ->find($product->product_id);
        //            if (count($this_product->modifier_sets) > 0) {
        //                $product_ms = $this_product->modifier_sets;
        //                foreach ($product_ms as $modifier_set){
        //                    foreach($modifier_set->variations as $modifier){
        //                        $output['modifier_products']['sub_modifier'] = $modifier;
        //                    }
        //                }
        ////                    $output['modifier_products'] = ['modifier' => $product_ms, 'row_count' => $row_count];
        //                $output['modifier_products'] = $product_ms;
        //            }
        //        }

//        $sell_details = TransactionSellLine::
        //        join(
        //            'products AS p',
        //            'transaction_sell_lines.product_id',
        //            '=',
        //            'p.id'
        //        )
        //            ->join(
        //                'variations AS variations',
        //                'transaction_sell_lines.variation_id',
        //                '=',
        //                'variations.id'
        //            )
        //            ->join(
        //                'product_variations AS pv',
        //                'variations.product_variation_id',
        //                '=',
        //                'pv.id'
        //            )
        //            ->leftjoin('variation_location_details AS vld', function ($join) use ($location_id) {
        //                $join->on('variations.id', '=', 'vld.variation_id')
        //                    ->where('vld.location_id', '=', $location_id);
        //            })
        //            ->leftjoin('units', 'units.id', '=', 'p.unit_id')
        //            ->where('transaction_sell_lines.transaction_id', $id)
        //            ->with(['warranties'])
        //            ->select(
        //                DB::raw("IF(pv.is_dummy = 0, CONCAT(p.name, ' (', pv.name, ':',variations.name, ')'), p.name) AS product_name"),
        //                'p.id as product_id',
        //                'p.brand_id',
        //                'p.category_id',
        //                'p.enable_stock',
        //                'p.name as product_actual_name',
        //                'p.type as product_type',
        //                'pv.name as product_variation_name',
        //                'pv.is_dummy as is_dummy',
        //                'variations.name as variation_name',
        //                'variations.sub_sku',
        //                'p.barcode_type',
        //                'p.enable_sr_no',
        //                'variations.id as variation_id',
        //                'units.short_name as unit',
        //                'units.allow_decimal as unit_allow_decimal',
        //                'transaction_sell_lines.tax_id as tax_id',
        //                'transaction_sell_lines.item_tax as item_tax',
        //                'transaction_sell_lines.unit_price as default_sell_price',
        //                'transaction_sell_lines.unit_price_before_discount as unit_price_before_discount',
        //                'transaction_sell_lines.unit_price_inc_tax as sell_price_inc_tax',
        //                'transaction_sell_lines.id as transaction_sell_lines_id',
        //                'transaction_sell_lines.id',
        //                'transaction_sell_lines.quantity as quantity_ordered',
        //                'transaction_sell_lines.sell_line_note as sell_line_note',
        //                'transaction_sell_lines.parent_sell_line_id',
        //                'transaction_sell_lines.lot_no_line_id',
        //                'transaction_sell_lines.line_discount_type',
        //                'transaction_sell_lines.line_discount_amount',
        //                'transaction_sell_lines.res_service_staff_id',
        //                'units.id as unit_id',
        //                'transaction_sell_lines.sub_unit_id',
        //                DB::raw('vld.qty_available + transaction_sell_lines.quantity AS qty_available')
        //            )
        //            ->get();
        //        if (!empty($sell_details)) {
        //            foreach ($sell_details as $key => $value) {
        //
        //                // Product Quantity
        //                $value['quantity'] = $quantity;
        //
        //                // Product Discount
        //                $is_cg = !empty($cg->id) ? true : false;
        //                $is_pg = !empty($price_group) ? true : false;
        //                $variation_id = $value->variation_id;
        //                $value['discount'] = $this->productUtil->getProductDiscount($value, $business_id, $location_id, $is_cg, $is_pg, $variation_id);
        //                if ($value['discount'] ==  null){
        //                    $value['discount'] = [
        //                        'id' => null,
        //                        'name' => null,
        //                        "discount_type" =>  null,
        //                        "discount_amount" => null,
        //                    ];
        //                }
        //                $discount = $value['discount'];
        //
        //                //If modifier or combo sell line then unset
        //                if (!empty($sell_details[$key]->parent_sell_line_id)) {
        //                    unset($sell_details[$key]);
        //                } else {
        //                    if ($transaction->status != 'final') {
        //                        $actual_qty_avlbl = $value->qty_available - $value->quantity_ordered;
        //                        $sell_details[$key]->qty_available = $actual_qty_avlbl;
        //                        $value->qty_available = $actual_qty_avlbl;
        //                    }
        //
        //                    $sell_details[$key]->formatted_qty_available = $this->productUtil->num_f($value->qty_available, false, null, true);
        //
        //                    //Add available lot numbers for dropdown to sell lines
        //                    $lot_numbers = [];
        //                    if (request()->session()->get('business.enable_lot_number') == 1 || request()->session()->get('business.enable_product_expiry') == 1) {
        //                        $lot_number_obj = $this->transactionUtil->getLotNumbersFromVariation($value->variation_id, $business_id, $location_id);
        //                        foreach ($lot_number_obj as $lot_number) {
        //                            //If lot number is selected added ordered quantity to lot quantity available
        //                            if ($value->lot_no_line_id == $lot_number->purchase_line_id) {
        //                                $lot_number->qty_available += $value->quantity_ordered;
        //                            }
        //
        //                            $lot_number->qty_formated = $this->productUtil->num_f($lot_number->qty_available);
        //                            $lot_numbers[] = $lot_number;
        //                        }
        //                    }
        //                    $sell_details[$key]->lot_numbers = $lot_numbers;
        //
        //                    if (!empty($value->sub_unit_id)) {
        //                        $value = $this->productUtil->changeSellLineUnit($business_id, $value);
        //                        $sell_details[$key] = $value;
        //                    }
        //
        //                    $sell_details[$key]->formatted_qty_available = $this->productUtil->num_f($value->qty_available, false, null, true);
        //
        //                    if ($this->transactionUtil->isModuleEnabled('modifiers')) {
        //                        //Add modifier details to sel line details
        //                        $sell_line_modifiers = TransactionSellLine::where('parent_sell_line_id', $sell_details[$key]->transaction_sell_lines_id)
        //                            ->where('children_type', 'modifier')
        //                            ->get();
        //                        $modifiers_ids = [];
        //                        if (count($sell_line_modifiers) > 0) {
        //                            $sell_details[$key]->modifiers = $sell_line_modifiers;
        //                            foreach ($sell_line_modifiers as $sell_line_modifier) {
        //                                $modifiers_ids[] = $sell_line_modifier->variation_id;
        //                            }
        //                        }
        //                        $sell_details[$key]->modifiers_ids = $modifiers_ids;
        //
        //                        //add product modifier sets for edit
        //                        $this_product = Product::find($sell_details[$key]->product_id);
        //                        if (count($this_product->modifier_sets) > 0) {
        //                            $sell_details[$key]->product_ms = $this_product->modifier_sets;
        //                            foreach ($sell_details[$key]->product_ms as $modifier_set){
        //                                foreach($modifier_set->variations as $modifier){
        //                                    $sell_details[$key]->product_ms->sub_modifier = $modifier;
        //                                }
        //                            }
        //                            $sell_details[$key]->product_ms = $sell_details[$key]->product_ms;
        //                        }
        //                    }
        //
        //                    //Get details of combo items
        //                    if ($sell_details[$key]->product_type == 'combo') {
        //                        $sell_line_combos = TransactionSellLine::where('parent_sell_line_id', $sell_details[$key]->transaction_sell_lines_id)
        //                            ->where('children_type', 'combo')
        //                            ->get()
        //                            ->toArray();
        //                        if (!empty($sell_line_combos)) {
        //                            $sell_details[$key]->combo_products = $sell_line_combos;
        //                        }
        //
        //                        //calculate quantity available if combo product
        //                        $combo_variations = [];
        //                        foreach ($sell_line_combos as $combo_line) {
        //                            $combo_variations[] = [
        //                                'variation_id' => $combo_line['variation_id'],
        //                                'quantity' => $combo_line['quantity'] / $sell_details[$key]->quantity_ordered,
        //                                'unit_id' => null
        //                            ];
        //                        }
        //                        $sell_details[$key]->qty_available =
        //                            $this->productUtil->calculateComboQuantity($location_id, $combo_variations);
        //
        //                        if ($transaction->status == 'final') {
        //                            $sell_details[$key]->qty_available = $sell_details[$key]->qty_available + $sell_details[$key]->quantity_ordered;
        //                        }
        //
        //                        $sell_details[$key]->formatted_qty_available = $this->productUtil->num_f($sell_details[$key]->qty_available, false, null, true);
        //                    }
        //                }
        //            }
        //        }

        $featured_products = $business_location->getFeaturedProducts();

        $payment_lines = $this->transactionUtil->getPaymentDetails($id);
        //If no payment lines found then add dummy payment line.
        if (empty($payment_lines)) {
            $payment_lines[] = $this->dummyPaymentLine;
        }

        $shortcuts = json_decode($business_details->keyboard_shortcuts, true);
        $pos_settings = empty($business_details->pos_settings) ? $this->businessUtil->defaultPosSettings() : json_decode($business_details->pos_settings,
            true);

        $commsn_agnt_setting = $business_details->sales_cmsn_agnt;
        $commission_agent = [];
        if ($commsn_agnt_setting == 'user') {
            $commission_agent = User::forDropdown($business_id, false);
        } elseif ($commsn_agnt_setting == 'cmsn_agnt') {
            $commission_agent = User::saleCommissionAgentsDropdown($business_id, false);
        }

        //If brands, category are enabled then send else false.
        $location_id = $request->get('location_id');

        $categories = (request()->session()->get('business.enable_category') == 1) ? Category::catAndSubCategories($business_id, $location_id) : false;
        $brands = (request()->session()->get('business.enable_brand') == 1) ? Brands::forDropdown($business_id)
            ->prepend(__('lang_v1.all_brands'), 'all') : false;

        $change_return = $this->dummyPaymentLine;

        $types = [];
        if (auth()->user()->can('supplier.create')) {
            $types['supplier'] = __('report.supplier');
        }
        if (auth()->user()->can('customer.create')) {
            $types['customer'] = __('report.customer');
        }
        if (auth()->user()->can('supplier.create') && auth()->user()->can('customer.create')) {
            $types['both'] = __('lang_v1.both_supplier_customer');
        }
        $customer_groups = CustomerGroup::forDropdown($business_id);

        //Accounts
        $accounts = [];
        if ($this->moduleUtil->isModuleEnabled('account')) {
            $accounts = Account::forDropdown($business_id, true, false, true);
        }

        $waiters = [];
        if ($this->productUtil->isModuleEnabled('service_staff') && !empty($pos_settings['inline_service_staff'])) {
            $waiters_enabled = true;
            $waiters = $this->productUtil->serviceStaffDropdown($business_id);
        }
        $redeem_details = [];
        if (request()->session()->get('business.enable_rp') == 1) {
            $redeem_details = $this->transactionUtil->getRewardRedeemDetails($business_id, $transaction->contact_id);

            $redeem_details['points'] += $transaction->rp_redeemed;
            $redeem_details['points'] -= $transaction->rp_earned;
        }

        $edit_discount = auth()->user()->can('edit_product_discount_from_pos_screen');
        $edit_price = auth()->user()->can('edit_product_price_from_pos_screen');
        $shipping_statuses = $this->transactionUtil->shipping_statuses();

        $warranties = $this->__getwarranties();
        $sub_type = request()->get('sub_type');

        //pos screen view from module
        $pos_module_data = $this->moduleUtil->getModuleData('get_pos_screen_view', ['sub_type' => $sub_type]);

        $invoice_schemes = [];
        $default_invoice_schemes = null;

        if ($transaction->status == 'draft') {
            $invoice_schemes = InvoiceScheme::forDropdown($business_id);
            $default_invoice_schemes = InvoiceScheme::getDefault($business_id);
        }

        $invoice_layouts = InvoiceLayout::forDropdown($business_id);

        $originalData = [
            'all_tax_dropdown' => $allTaxDropdown, 'payment_types' => $payment_types,
            'walk_in_customer' => $walk_in_customer, 'product' => $sell_details, 'transaction' => $transaction,
            'payment_lines' => $payment_lines, 'commission_agent' => $commission_agent, 'categories' => $categories,
            'pos_settings' => $pos_settings, 'change_return' => $change_return, 'types' => $types,
            'customer_groups' => $customer_groups, 'brands' => $brands, 'accounts' => $accounts,
            'waiters' => $waiters, 'redeem_details' => $redeem_details, 'edit_price' => $edit_price,
            'edit_discount' => $edit_discount, 'shipping_statuses' => $shipping_statuses,
            'warranties' => $warranties, 'sub_type' => $sub_type, 'pos_module_data' => $pos_module_data,
            'invoice_schemes' => $invoice_schemes, 'default_invoice_schemes' => $default_invoice_schemes,
            'invoice_layouts' => $invoice_layouts, 'featured_products' => $featured_products,
        ];

        $discount = null;
        $output['product_row'] = [
            'product' => $sell_details, 'all_tax_dropdown' => $allTaxDropdown, 'pos_settings' => $pos_settings,
            'discount' => $discount, 'waiters' => $waiters, 'edit_discount' => $edit_discount,
            'edit_price' => $edit_price, 'warranties' => $warranties,
        ];

        $enabledTax = false;
        if ($request->session()->get('business.enable_inline_tax') == 1) {
            $enabledTax = true;
        }
        $common_settings = session()->get('business.common_settings');
        $is_warranty_enabled = !empty($common_settings['enable_product_warranty']) ? true : false;

        $products = [];
        $modifierTaxes = [];
        foreach ($sell_details as $key => $sell_detail) {
            $tax_dropdown = null;
//            if (!empty($sell_detail->product->tax) && $sell_detail->product->tax_type == 'inclusive') {
            //                $tax_dropdown = TaxRate::where('business_id', $business_id)->where('id',
            //                    $sell_detail->product->tax)->first();
            //            }
            if (!empty($sell_detail->tax_id) && $sell_detail->product->tax_type == 'inclusive') {
                $tax_dropdown = TaxRate::where('business_id', $business_id)->where('id', $sell_detail->tax_id)->first();
            }
            $data['product_row']['product'] = $sell_detail->product;
            $data['product_row']['product']['product_id'] = $sell_detail->product->id;
            $data['product_row']['product']['product_name'] = $sell_detail->product->name;
            $data['product_row']['product']['contact_id'] = $transaction->contact_id;
            $data['product_row']['product']['customer_name'] = $transaction->contact->name;
            $data['product_row']['product']['product_type'] = $sell_detail->product->type;
//            $data['product_row']['product']['tax_id'] = $sell_detail->product->tax;
            $data['product_row']['product']['tax_id'] = $sell_detail->tax_id;
            $data['product_row']['quantity'] = $sell_detail->quantity;
            $data['product_row']['tax_dropdown'] = $tax_dropdown;
            $data['product_row']['all_tax_dropdown'] = $allTaxDropdown;
            $data['product_row']['enabled_tax'] = $enabledTax;
            $data['product_row']['enabled_warranties'] = $is_warranty_enabled;
            $data['product_row']['pos_settings'] = $pos_settings;
            $data['product_row']['discount'] = $discount;
            $data['product_row']['waiters'] = $waiters;
            $data['product_row']['edit_discount'] = $edit_discount;
            $data['product_row']['edit_price'] = $edit_price;
            $data['product_row']['warranties'] = $warranties;
            $data['modifier_products'] = [];
            $data['modifiers'] = [];

            // Product Discount
            $is_cg = !empty($cg->id) ? true : false;
            $is_pg = !empty($price_group) ? true : false;
            $data['product_row']['discount'] = $this->productUtil->getProductDiscount($sell_detail, $business_id,
                $location_id, $is_cg, $is_pg, $data['product_row']['product']['variation_id']);
            if ($data['product_row']['discount'] == null) {
                $data['product_row']['discount'] = [
                    'id' => null,
                    'name' => null,
                    "discount_type" => null,
                    "discount_amount" => null,
                ];
            }
            $data['product_row']['discount']['discount_type'] = $sell_detail->line_discount_type;
            $data['product_row']['discount']['discount_amount'] = $sell_detail->line_discount_amount;

            // Selector Modifier
            $selectorModifier = TransactionSellLine::where('parent_sell_line_id', $sell_details[$key]->id)
                ->where('children_type', 'modifier')->get();

            $modifiers_ids = [];
            if (count($selectorModifier) > 0) {
                $sell_details[$key]->modifiers = $selectorModifier;
                foreach ($selectorModifier as $sell_line_modifier) {
                    $modifiers_ids[] = $sell_line_modifier->variation_id;
                }
            }
            $data['modifiers'] = Variation::whereIn('id', $modifiers_ids)->get();
            foreach ($data['modifiers'] as $key => $modifier) {
                if (!is_null($modifier->tax_id) && $modifier->tax_type == 'inclusive') {
                    $taxRate = TaxRate::where('id', $modifier->tax_id)->first();
                    $data['modifiers'][$key]['tax_dropdown'] = $taxRate;
                    array_push($modifierTaxes,
                        $sell_detail->quantity * ($modifier->default_sell_price * $taxRate->amount / 100));
                } else {
                    $data['modifiers'][$key]['tax_dropdown'] = null;
                }
            }

            //Product Variations
            foreach ($sell_detail->product->variations as $variation) {
                $data['product_row']['product']['product_variation_name'] = $variation->name;
                $data['product_row']['product']['variation_name'] = $variation->name;
                $data['product_row']['product']['variation_id'] = $variation->id;
                $data['product_row']['product']['default_sell_price'] = $variation->default_sell_price;
                $data['product_row']['product']['sell_price_inc_tax'] = $variation->sell_price_inc_tax;
                $data['product_row']['product']['quantity'] = $sell_detail->quantity;
                $data['product_row']['product']['unit_price_inc_tax'] = $sell_detail->unit_price_inc_tax;
                $data['product_row']['product']['unit_price'] = $sell_detail->unit_price;
                $data['product_row']['product']['sell_line_note'] = $sell_detail->sell_line_note;
            }

            if (!empty($sell_detail->product->modifier_sets)) {
                $modifierProducts = $sell_detail->product->modifier_sets;
                foreach ($modifierProducts as $modifierProduct) {
                    foreach ($modifierProduct->variations as $modifier) {
                        $data['modifier_products']['sub_modifier'] = $modifier;
                    }
                }
                $data['modifier_products'] = $modifierProducts;
            }
            $data['product_row']['product']['modifier_tax'] = array_sum($modifierTaxes);
            $products[] = $data;
        }

        $items = [
            'transaction_id' => $transaction->id,
            'products' => $products,
        ];

        return response($items, 200);
    }

    /**
     * @param  Request  $request
     *
     * @return array|Application|ResponseFactory|RedirectResponse|Response
     */
    public function updateSuspendedSales(Request $request)
    {
        if (!auth()->user()->can('sell.update') && !auth()->user()->can('direct_sell.access')) {
            return response(['errors' => 'Unauthorized action'], 403);
        }

        $id = $request->get('transaction_id');

        try {
            $input = $request->except('_token');

            //status is send as quotation from edit sales screen.
            $input['is_quotation'] = 0;
            if ($input['status'] == 'quotation') {
                $input['status'] = 'draft';
                $input['is_quotation'] = 1;
            }

            $is_direct_sale = false;
            if (!empty($input['products'])) {
                //Get transaction value before updating.
                $transaction_before = Transaction::find($id);
                $status_before = $transaction_before->status;
                $rp_earned_before = $transaction_before->rp_earned;
                $rp_redeemed_before = $transaction_before->rp_redeemed;

                if ($transaction_before->is_direct_sale == 1) {
                    $is_direct_sale = true;
                }

                $business_id = $request->session()->get('user.business_id');
                // Contact Id
                $contact_id = $request->get('contact_id', null);
                if ($contact_id == 'no_customer_select') {
                    $contact_id = Contact::where('business_id', $business_id)->first()->id;
                }
                $input['contact_id'] = $contact_id;

                //Check Customer credit limit
                $is_credit_limit_exeeded = $this->transactionUtil->isCustomerCreditLimitExeeded($input, $id);

                if ($is_credit_limit_exeeded !== false) {
                    $credit_limit_amount = $this->transactionUtil->num_f($is_credit_limit_exeeded, true);
                    $output = ['success' => 0,
                        'msg' => __('lang_v1.cutomer_credit_limit_exeeded', ['credit_limit' => $credit_limit_amount]),
                        'receipt' => null,
                    ];
                    if (!$is_direct_sale) {
                        return $output;
                    } else {
                        return response(['url' => 'SellController@index', 'status' => $output]);
                    }
                }

                //Check if there is a open register, if no then redirect to Create Register screen.
                if (!$is_direct_sale && $this->cashRegisterUtil->countOpenedRegister() == 0) {
                    return response(['url' => 'CashRegisterController@create']);
                }

                $user_id = $request->session()->get('user.id');
                $commsn_agnt_setting = $request->session()->get('business.sales_cmsn_agnt');

                $discount = ['discount_type' => $input['discount_type'],
                    'discount_amount' => $input['discount_amount'],
                ];
                $invoice_total = $this->productUtil->calculateInvoiceTotal($input['products'], $input['tax_rate_id'], $discount);

                if (!empty($request->input('transaction_date'))) {
                    $input['transaction_date'] = $this->productUtil->uf_date($request->input('transaction_date'), true);
                }

                $input['commission_agent'] = !empty($request->input('commission_agent')) ? $request->input('commission_agent') : null;
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

                $input['is_suspend'] = isset($input['is_suspend']) && 1 == $input['is_suspend'] ? 1 : 0;
                if ($input['is_suspend']) {
                    $input['sale_note'] = !empty($input['additional_notes']) ? $input['additional_notes'] : null;
                }

                if ($status_before == 'draft' && !empty($request->input('invoice_scheme_id'))) {
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

                //Begin transaction
                DB::beginTransaction();

                $transaction = $this->transactionUtil->updateSellTransaction($id, $business_id, $input, $invoice_total, $user_id);

                //Update Sell lines
                $deleted_lines = $this->transactionUtil->createOrUpdateSellLinesTransaction($transaction, $input['products'], $input['location_id'], true, $status_before);

                //Update update lines
                $is_credit_sale = isset($input['is_credit_sale']) && $input['is_credit_sale'] == 1 ? true : false;

                if (!$is_direct_sale && !$transaction->is_suspend && !$is_credit_sale) {
                    //Add change return
                    $change_return = $this->dummyPaymentLine;
                    $change_return['amount'] = $input['change_return'];
                    $change_return['is_return'] = 1;
                    if (!empty($input['change_return_id'])) {
                        $change_return['id'] = $input['change_return_id'];
                    }
                    $input['payment'][] = $change_return;

                    $this->transactionUtil->createOrUpdatePaymentLines($transaction, $input['payment']);

                    //Update cash register
                    $this->cashRegisterUtil->updateSellPayments($status_before, $transaction, $input['payment']);
                }

                if ($request->session()->get('business.enable_rp') == 1) {
                    $this->transactionUtil->updateCustomerRewardPoints($contact_id, $transaction->rp_earned, $rp_earned_before, $transaction->rp_redeemed, $rp_redeemed_before);
                }

                //Update payment status
                $this->transactionUtil->updatePaymentStatus($transaction->id, $transaction->final_total);

                //Update product stock
                $this->productUtil->adjustProductStockForInvoice($status_before, $transaction, $input);

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
                $this->transactionUtil->adjustMappingPurchaseSell($status_before, $transaction, $business, $deleted_lines);

                $log_properties = [];
                if (isset($input['repair_completed_on'])) {
                    $completed_on = !empty($input['repair_completed_on']) ? $this->transactionUtil->uf_date($input['repair_completed_on'], true) : null;
                    if ($transaction->repair_completed_on != $completed_on) {
                        $log_properties['completed_on_from'] = $transaction->repair_completed_on;
                        $log_properties['completed_on_to'] = $completed_on;
                    }
                }

                //Set Module fields
                if (!empty($input['has_module_data'])) {
                    $this->moduleUtil->getModuleData('after_sale_saved', ['transaction' => $transaction, 'input' => $input]);
                }

                Media::uploadMedia($business_id, $transaction, $request, 'documents');

                activity()
                    ->performedOn($transaction)
                    ->log('edited');

                DB::commit();

                if ($request->input('is_save_and_print') == 1) {
                    $url = $this->transactionUtil->getInvoiceUrl($id, $business_id);
                    return redirect()->to($url . '?print_on_load=true');
                }

                $msg = '';
                $receipt = '';

                $invoice_layout_id = $request->input('invoice_layout_id');

                if ($input['status'] == 'draft' && $input['is_quotation'] == 0) {
                    $msg = trans("sale.draft_added");
                } elseif ($input['status'] == 'draft' && $input['is_quotation'] == 1) {
                    $msg = trans("lang_v1.quotation_updated");
                    if (!$is_direct_sale) {
//                        $receipt = $this->receiptContent($business_id, $input['location_id'], $transaction->id, null, false, true, $invoice_layout_id);
                    } else {
                        $receipt = '';
                    }
                } elseif ($input['status'] == 'final') {
                    $msg = trans("sale.pos_sale_updated");
                    if (!$is_direct_sale) {
//                        $receipt = $this->receiptContent($business_id, $input['location_id'], $transaction->id, null, false, true, $invoice_layout_id);
                    } else {
                        $receipt = '';
                    }
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
            $output = ['success' => 0,
                'msg' => __('messages.something_went_wrong'),
            ];
        }

        if (!$is_direct_sale) {
            return $output;
        } else {
            if ($input['status'] == 'draft') {
                if (isset($input['is_quotation']) && $input['is_quotation'] == 1) {
                    return response(['url' => 'SellController@getQuotations', 'status' => $output]);
                } else {
                    return response(['url' => 'SellController@getDrafts', 'status' => $output]);
                }
            } else {
                if (!empty($transaction->sub_type) && $transaction->sub_type == 'repair') {
                    return response(['url' => '\Modules\Repair\Http\Controllers\RepairController@index', 'status' => $output]);
                }
                return response(['url' => 'SellController@index', 'status' => $output]);
            }
        }
    }

    /**
     * @param  Request  $request
     *
     * @return array|Application|ResponseFactory|RedirectResponse|Response
     */
    public function updateFinalizePayment(Request $request)
    {
        if (!auth()->user()->can('sell.update') && !auth()->user()->can('direct_sell.access')) {
            return response(['errors' => 'Unauthorized action'], 403);
        }

        $id = $request->get('transaction_id');

        try {
            $input = $request->except('_token');

            //status is send as quotation from edit sales screen.
            $input['is_quotation'] = 0;
            if ($input['status'] == 'quotation') {
                $input['status'] = 'draft';
                $input['is_quotation'] = 1;
            }

            $is_direct_sale = false;
            if (!empty($input['products'])) {
                //Get transaction value before updating.
                $transaction_before = Transaction::find($id);
                $status_before = $transaction_before->status;
                $rp_earned_before = $transaction_before->rp_earned;
                $rp_redeemed_before = $transaction_before->rp_redeemed;

                if ($transaction_before->is_direct_sale == 1) {
                    $is_direct_sale = true;
                }

                $business_id = $request->session()->get('user.business_id');
                // Contact Id
                $contact_id = $request->get('contact_id', null);
                if ($contact_id == 'no_customer_select') {
                    $contact_id = Contact::where('business_id', $business_id)->first()->id;
                }
                $input['contact_id'] = $contact_id;

                //Check Customer credit limit
                $is_credit_limit_exeeded = $this->transactionUtil->isCustomerCreditLimitExeeded($input, $id);

                if ($is_credit_limit_exeeded !== false) {
                    $credit_limit_amount = $this->transactionUtil->num_f($is_credit_limit_exeeded, true);
                    $output = ['success' => 0,
                        'msg' => __('lang_v1.cutomer_credit_limit_exeeded', ['credit_limit' => $credit_limit_amount]),
                        'receipt' => null,
                    ];
                    if (!$is_direct_sale) {
                        return $output;
                    } else {
                        return response(['url' => 'SellController@index', 'status' => $output]);
                    }
                }

                //Check if there is a open register, if no then redirect to Create Register screen.
                if (!$is_direct_sale && $this->cashRegisterUtil->countOpenedRegister() == 0) {
                    return response(['url' => 'CashRegisterController@create']);
                }

                $user_id = $request->session()->get('user.id');
                $commsn_agnt_setting = $request->session()->get('business.sales_cmsn_agnt');

                $discount = ['discount_type' => $input['discount_type'],
                    'discount_amount' => $input['discount_amount'],
                ];
                $invoice_total = $this->productUtil->calculateInvoiceTotal($input['products'], $input['tax_rate_id'], $discount);

                if (!empty($request->input('transaction_date'))) {
                    $input['transaction_date'] = $this->productUtil->uf_date($request->input('transaction_date'), true);
                }

                $input['commission_agent'] = !empty($request->input('commission_agent')) ? $request->input('commission_agent') : null;
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

                $input['is_suspend'] = isset($input['is_suspend']) && 1 == $input['is_suspend'] ? 1 : 0;
                if ($input['is_suspend']) {
                    $input['sale_note'] = !empty($input['additional_notes']) ? $input['additional_notes'] : null;
                }

                if ($status_before == 'draft' && !empty($request->input('invoice_scheme_id'))) {
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

                //Begin transaction
                DB::beginTransaction();

                $transaction = $this->transactionUtil->updateSellTransaction($id, $business_id, $input, $invoice_total, $user_id);

                //Update Sell lines
                $deleted_lines = $this->transactionUtil->createOrUpdateSellLinesTransaction($transaction, $input['products'], $input['location_id'], true, $status_before);

                //Update update lines
                $is_credit_sale = isset($input['is_credit_sale']) && $input['is_credit_sale'] == 1 ? true : false;

                if (!$is_direct_sale && !$transaction->is_suspend && !$is_credit_sale) {
                    //Add change return
                    $change_return = $this->dummyPaymentLine;
                    $change_return['amount'] = $input['change_return'];
                    $change_return['is_return'] = 1;
                    if (!empty($input['change_return_id'])) {
                        $change_return['id'] = $input['change_return_id'];
                    }
                    $input['payment'][] = $change_return;

                    $this->transactionUtil->createOrUpdatePaymentLines($transaction, $input['payment']);

                    //Update cash register
                    $this->cashRegisterUtil->updateSellPayments($status_before, $transaction, $input['payment']);
                }

                if ($request->session()->get('business.enable_rp') == 1) {
                    $this->transactionUtil->updateCustomerRewardPoints($contact_id, $transaction->rp_earned, $rp_earned_before, $transaction->rp_redeemed, $rp_redeemed_before);
                }

                //Update payment status
                $this->transactionUtil->updatePaymentStatus($transaction->id, $transaction->final_total);

                //Update product stock
                $this->productUtil->adjustProductStockForInvoice($status_before, $transaction, $input);

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
                $this->transactionUtil->adjustMappingPurchaseSell($status_before, $transaction, $business, $deleted_lines);

                $log_properties = [];
                if (isset($input['repair_completed_on'])) {
                    $completed_on = !empty($input['repair_completed_on']) ? $this->transactionUtil->uf_date($input['repair_completed_on'], true) : null;
                    if ($transaction->repair_completed_on != $completed_on) {
                        $log_properties['completed_on_from'] = $transaction->repair_completed_on;
                        $log_properties['completed_on_to'] = $completed_on;
                    }
                }

                //Set Module fields
                if (!empty($input['has_module_data'])) {
                    $this->moduleUtil->getModuleData('after_sale_saved', ['transaction' => $transaction, 'input' => $input]);
                }

                Media::uploadMedia($business_id, $transaction, $request, 'documents');

                activity()
                    ->performedOn($transaction)
                    ->log('edited');

                // Delete Suspend sells
                //                if (!empty($request->get('transactionId'))){
                //                    $transaction = Transaction::find($id);
                //                    $transaction->delete();
                //                }

                DB::commit();

                if ($request->input('is_save_and_print') == 1) {
                    $url = $this->transactionUtil->getInvoiceUrl($id, $business_id);
                    return redirect()->to($url . '?print_on_load=true');
                }

                $msg = '';
                $receipt = '';

                $invoice_layout_id = $request->input('invoice_layout_id');

                if ($input['status'] == 'draft' && $input['is_quotation'] == 0) {
                    $msg = trans("sale.draft_added");
                } elseif ($input['status'] == 'draft' && $input['is_quotation'] == 1) {
                    $msg = trans("lang_v1.quotation_updated");
                    if (!$is_direct_sale) {
                        $receipt = $this->receiptContent($business_id, $input['location_id'], $transaction->id, null, false, true, $invoice_layout_id, $user_id);
                    } else {
                        $receipt = null;
                    }
                } elseif ($input['status'] == 'final') {
                    $msg = trans("sale.pos_sale_updated");
                    if (!$is_direct_sale) {
                        $receipt = $this->receiptContent($business_id, $input['location_id'], $transaction->id, null, false, true, $invoice_layout_id, $user_id);
                    } else {
                        $receipt = null;
                    }
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
            $output = ['success' => 0,
                'msg' => __('messages.something_went_wrong'),
                'receipt' => null,
            ];
        }

        if (!$is_direct_sale) {
            return $output;
        } else {
            if ($input['status'] == 'draft') {
                if (isset($input['is_quotation']) && $input['is_quotation'] == 1) {
                    return response(['url' => 'SellController@getQuotations', 'status' => $output]);
                } else {
                    return response(['url' => 'SellController@getDrafts', 'status' => $output]);
                }
            } else {
                if (!empty($transaction->sub_type) && $transaction->sub_type == 'repair') {
                    return response(['url' => '\Modules\Repair\Http\Controllers\RepairController@index', 'status' => $output]);
                }
                return response(['url' => 'SellController@index', 'status' => $output]);
            }
        }
    }

    private function __getwarranties()
    {
        $business_id = session()->get('user.business_id');
        $common_settings = session()->get('business.common_settings');
        $is_warranty_enabled = !empty($common_settings['enable_product_warranty']) ? true : false;
        $warranties = $is_warranty_enabled ? Warranty::where('business_id', $business_id)
            ->get() : [];

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
        if ((strlen($scale_setting['label_prefix']) == 0) || Str::startsWith($scale_barcode,
            $scale_setting['label_prefix'])) {
            $scale_barcode = substr($scale_barcode, strlen($scale_setting['label_prefix']));

            //Get product sku, trim left side 0
            $sku = ltrim(substr($scale_barcode, 0, $scale_setting['product_sku_length'] + 1), '0');

            //Get quantity integer
            $qty_int = substr($scale_barcode, $scale_setting['product_sku_length'] + 1,
                $scale_setting['qty_length'] + 1);

            //Get quantity decimal
            $qty_decimal = '0.' . substr($scale_barcode,
                $scale_setting['product_sku_length'] + $scale_setting['qty_length'] + 2,
                $scale_setting['qty_length_decimal'] + 1);

            $qty = (float) $qty_int + (float) $qty_decimal;

            //Find the variation id
            $result = $this->productUtil->filterProduct($business_id, $sku, null, false, null, [], ['sub_sku'], false,
                'exact')->first();

            if (!empty($result)) {
                return [
                    'variation_id' => $result->variation_id,
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
