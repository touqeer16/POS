<?php

namespace App\Http\Controllers;

use App\Business;
use App\BusinessLocation;
use App\KitchenStation;
use App\Printer;
use App\InvoiceLayout;
use App\InvoiceScheme;

use Illuminate\Http\Request;

class LocationSettingsController extends Controller
{
    /**
     * All class instance.
     *
     */
    protected $printReceiptOnInvoice;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->printReceiptOnInvoice = ['1' => __('messages.yes'), '0' => __('messages.no')];
        $this->receiptPrinterType = [
            'browser' => __('lang_v1.browser_based_printing'), 'printer' => __('lang_v1.configured_printer'),
            'app'     => __('lang_v1.android_printing_app'),
        ];
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($location_id)
    {
        //Check for locations access permission
        if (!auth()->user()->can('business_settings.access') ||
            !auth()->user()->can_access_this_location($location_id)
        ) {
            abort(403, 'Unauthorized action.');
        }

        $business_id = request()->session()->get('user.business_id');

        $location = BusinessLocation::where('business_id', $business_id)
            ->findorfail($location_id);

        $printers = Printer::forDropdown($business_id);

        $printReceiptOnInvoice = $this->printReceiptOnInvoice;
        $receiptPrinterType = $this->receiptPrinterType;

        $invoice_layouts = InvoiceLayout::where('business_id', $business_id)
            ->get()
            ->pluck('name', 'id');
        $invoice_schemes = InvoiceScheme::where('business_id', $business_id)
            ->get()
            ->pluck('name', 'id');
        $kitchenStations = KitchenStation::where('business_location_id', $location->id)->get();

        $business = Business::where('id', $business_id)->first();

        return view('location_settings.index')
            ->with(compact('location', 'printReceiptOnInvoice', 'receiptPrinterType', 'printers', 'invoice_layouts',
                'invoice_schemes', 'kitchenStations', 'business'));
    }

    /**
     * Update the settings
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function updateSettings($location_id, Request $request)
    {
        try {
            //Check for locations access permission
            if (! auth()->user()->can('business_settings.access') ||
                ! auth()->user()->can_access_this_location($location_id)
            ) {
                abort(403, 'Unauthorized action.');
            }

            $input = $request->only([
                'print_receipt_on_invoice', 'receipt_printer_type', 'number_of_thermal_print_copy', 'printer_id',
                'invoice_layout_id', 'invoice_scheme_id',
            ]);

            //Auto set to browser in demo.
            if (config('app.env') == 'demo') {
                $input['receipt_printer_type'] = 'browser';
            }

            $business_id = request()->session()->get('user.business_id');

            $location = BusinessLocation::where('business_id', $business_id)
                ->findorfail($location_id);

            $location->fill($input);
            $location->update();
            $input1 = $request->get('station_name');
            $input2 = $request->get('station_name_existing');
            if (empty($input1) && empty($input2)){
                KitchenStation::where('business_location_id','=',$location->id)->delete();
            }
            $kitchenStations = KitchenStation::where('business_location_id',$location->id)->pluck('id')->toArray();
            if (!empty($input1) && !empty($input2)){
                $diff = array_diff($kitchenStations, array_keys($input2));
                KitchenStation::whereIn('id', $diff)->delete();
            }
            if (!empty($input2)){
                foreach ($input2 as $key => $value) {
                    $isExist = KitchenStation::where('id', '=', $key)->exists();
                    if ($isExist) {
                        KitchenStation::where('id', '=', $key)->update(['station_name' => $value]);
                    }
                }
            }
            if (! empty($input1)) {
                foreach ($input1 as $value) {
                    KitchenStation::create([
                        'business_id'          => $business_id,
                        'business_location_id' => $location->id,
                        'station_name'         => $value,
                    ]);
                }
            }

            $output = [
                'success' => 1,
                'msg'     => __("receipt.receipt_settings_updated"),
            ];
        } catch (\Exception $e) {
            $output = [
                'success' => 0,
                'msg'     => __("messages.something_went_wrong"),
            ];
        }

        return back()->with('status', $output);
    }
}
