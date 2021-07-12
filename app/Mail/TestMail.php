<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class TestMail extends Mailable
{
    use Queueable, SerializesModels;

    public $testemail;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($testemail)
    {
        $this->testemail = $testemail;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Adhe Toko')
                    ->view('testemail');
    }
}
