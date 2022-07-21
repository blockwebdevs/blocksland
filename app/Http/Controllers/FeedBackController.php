<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Mail;
use Illuminate\Http\Request;
use App\Models\FeedBack;
use Illuminate\Support\Facades\Session;

class FeedBackController extends Controller
{
    private $adminEmail = 'blockslandonline@gmail.com';

    public function sendFeedBack(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|min:2',
            'email' => 'required',
            'phone' => 'required',
            'message' => 'required',
        ]);

        $feedback = new FeedBack();
        $feedback->first_name = request('name');
        $feedback->email = request('email');
        $feedback->phone = request('phone');
        $feedback->message = request('message');
        $feedback->subject = 'feedback';
        $feedback->status = 'new';
        $feedback->save();

        $to = $this->adminEmail;
        $feedback = $feedback->toArray();
        $feedback['formMessage'] = $feedback['message'];

        try {
            Mail::send('emails.contact-form', $feedback, function ($message) use ($to, $feedback) {
                $message->to($to, 'Contactează-ne #' . $feedback['id'])
                    ->from('blockslandonline@gmail.com')
                    ->subject('Contactează-ne #' . $feedback['id']);
            });
        } catch (\Exception $e) {}

        Session::flash('success', trans('vars.notifications.thanksFeedback'));

        return redirect()->back();
    }

    public function orderCall(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|min:2',
            'email' => 'required',
            'phone' => 'required',
        ]);

        $feedback = new FeedBack();
        $feedback->first_name = request('name');
        $feedback->email = request('email');
        $feedback->phone = request('phone');
        $feedback->message = request('message');
        $feedback->additional_1 = request('url');
//        $feedback->additional_2 = request('agent_email');
        $feedback->additional_3 = request('contact_method');
        $feedback->subject = 'order call';
        $feedback->status = 'new';
        $feedback->save();

        $to = $this->adminEmail;
        $agentEmail = request('agent-email');
        $feedback = $feedback->toArray();

        try {
            Mail::send('emails.order-call', $feedback, function ($message) use ($to, $feedback) {
                $message->to($to, 'Comandă un apel #' . $feedback['id'])
                    ->from('blockslandonline@gmail.com')
                    ->subject('Comandă un apel #' . $feedback['id']);
            });

            if ($agentEmail && ($to !== $agentEmail)) {
                Mail::send('emails.order-call', $feedback, function ($message) use ($agentEmail, $feedback) {
                    $message->to($agentEmail, 'Comandă un apel #' . $feedback['id'])
                        ->from('blockslandonline@gmail.com')
                        ->subject('Comandă un apel #' . $feedback['id']);
                });
            }
        } catch (\Exception $e) {}

        Session::flash('success', trans('vars.notifications.thankYou'));

        return redirect()->back();
    }
}
