<?php

namespace App;

use App\Transaction;
use Illuminate\Database\Eloquent\Model;

class CallNumberScheme extends Model
{
    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = ['id'];

    /**
     * Returns list of invoice schemes in array format
     */
    public static function forDropdown($business_id)
    {
        $dropdown = InvoiceScheme::where('business_id', $business_id)
            ->pluck('call_number_count', 'id');

        return $dropdown;
    }

    /**
     * Retrieves the default invoice scheme
     */
    public static function getDefault($business_id)
    {
        $default = InvoiceScheme::where('business_id', $business_id)
            ->where('is_default', 1)
            ->first();
        return $default;
    }

    public static function callNumberGeneration($business_id, $location_id, $transaction_id = null, $user_id = null)
    {
        $call_No = '';
        /* $call_Number_Scheme = CallNumberScheme::where('business_id', $business_id)->where('location_id', $location_id)->where('user_id', $user_id)->first(); */
        $call_Number_Scheme = CallNumberScheme::where('business_id', $business_id)->where('location_id', $location_id)->first();
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
}
