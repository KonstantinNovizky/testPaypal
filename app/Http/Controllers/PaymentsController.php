<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Srmklive\PayPal\Services\ExpressCheckout;

class PaymentsController extends Controller
{
    public function index() {
        return view('paywithpaypal');
    }

    public function handlePayment(Request $request)
    {
        $request->validate([
            'amount' => 'required'
        ]);

        $product = [];
        $product['items'] = [
            [
                'name' => 'Nike Joyride 2',
                'price' => $request->amount,
                'desc'  => 'Running shoes for Men',
                'qty' => 1
            ]
        ];

        $product['invoice_id'] = 1;
        $product['invoice_description'] = "Order #{$product['invoice_id']} Bill";
        $product['return_url'] = route('success.payment');
        $product['cancel_url'] = route('cancel.payment');
        $product['total'] = $request->amount;

        try {
            $paypalModule = new ExpressCheckout;
            $res = $paypalModule->setExpressCheckout($product);
            $res = $paypalModule->setExpressCheckout($product, true);

            return redirect($res['paypal_link']);
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    public function paymentCancel()
    {
        return 'Your payment has been declend. The payment cancelation page goes here!';
    }

    public function paymentSuccess(Request $request)
    {
        try {

            $paypalModule = new ExpressCheckout;
            $response = $paypalModule->getExpressCheckoutDetails($request->token);

                if (in_array(strtoupper($response['ACK']), ['SUCCESS', 'SUCCESSWITHWARNING'])) {
                    return 'Payment was successfull. The payment success page goes here!';
                }

            } catch (\Exception $e) {
            return $e->getMessage();
        }
    }
}