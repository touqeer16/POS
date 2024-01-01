<?php

namespace App\Http\Controllers\Api;

use App\Business;
use App\CashRegister;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        //        $input = $request->all();
        //        $validator = Validator::make($request->all(), [
        //            'email' => 'required|string|email|max:255',
        //            'password' => 'required|string',
        //        ]);
        //        if ($validator->fails()) {
        //            return response(['errors' => $validator->errors()->all()], 422);
        //        }
        //        $user = User::where('email', $input['email'])->first();
        //        if ($user){
        //            if (Hash::check($input['password'], $user->password)){
        //                $token = $user->createToken('Laravel Password Grant Client')->accessToken;
        //                return response(['token' => $token], 200);
        //            }else{
        //                return response(['message' => 'Password mismatch'],422);
        //            }
        //        }else{
        //            return response(['message' => 'User does not exist'], 422);
        //        }

        $user = request()->session()->get('user');
        $user_id = auth()->user()->id;
        $userTemp = User::where('id', $user_id)->first();
        $business_id = $userTemp->business_id ?? "";
        $selectedBusiness = Business::where('id', $business_id)->first();
        // return response(['business_locations' => $selectedBusiness], '200');
        $business_name = $selectedBusiness->name ?? "";
        $tax_number_1 = $selectedBusiness->tax_number_1 ?? "";
        if (!empty($business_name)) {
            $user['business_name'] = $business_name;
        }
        if (!empty($tax_number_1)) {
            $user['tax_number_1'] = $tax_number_1;
        }

        $count = CashRegister::where('user_id', $user_id)
            ->where('status', 'open')
            ->count();
        $user['openedRegisterCount'] = $count;
        $user['business_id'] = $business_id;

        return response(['user' => $user], 200);
    }
}
