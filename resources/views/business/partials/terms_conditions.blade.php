<div class="modal fade" id="tc_modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title pull-left">
                    @lang('lang_v1.terms_conditions')
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">

                        @if(!empty($system_settings['superadmin_register_tc']))
                        {!!$system_settings['superadmin_register_tc']!!}
                        @endif
                        <h5> Please read these Terms of Service (“Terms”) carefully as they contain important
                            information
                            about your legal rights, remedies and obligations. By accessing or using the Iylus Platform,
                            you agree to comply with and be bound by these Terms.</h5>
                        <p>


                            These Terms of Use (“TOU”) are an agreement between the users (“you” or “your”) of the
                            websites identified below on the one hand and Safe n Smart Solutions, its subsidiaries,
                            brands, and affiliates (collectively, “Company”, “we”, “us”) on the other hand (each of
                            Company and you may be referred to herein as a “Party” or, collectively, “Parties”). These
                            TOU apply to the website(s) iylus.com and such other mobile applications, websites, domains,
                            and sub-domains and the related services, however accessed and/or used, whether via personal
                            computers, mobile devices, security products made by us (“Products”) or third parties or
                            otherwise, as well as mobile applications, interactive features and downloads that the
                            Company owns, operates, and makes available through its websites and mobile applications
                            (collectively, the “Sites”). This includes interactive features or materials and mobile
                            applications that by their nature interacts with the Sites. In addition to your access to
                            the Sites, these TOU govern your use of and access to content, including, without
                            limitation, any information, text, software, scripts, graphics, photographs, audio and/or
                            visual materials (individually or in combination), features and other materials uploaded,
                            downloaded or appearing on or available through the Sites (collectively, “Content”).

                            The Sites are intended for a general audience aged eighteen (18) years and older. If you are
                            under the age of 18, you are prohibited from using the Sites.
                        </p>
                        <h1> Acceptance of Terms</h1>
                        <p>


                            Your access to and use of the Sites, Content, and Services offered to you is expressly
                            conditioned on your acceptance in their entirety, without modification, of these TOU, our
                            Privacy Policy iylus.com/Privacy, and the other policies posted on the Sites. Your use of
                            the Sites constitutes your agreement to all such terms, conditions, and notices. Your use of
                            a particular section of the Site may also be subject to additional terms as set forth in
                            such section (“Additional Terms”). By entering the Sites, you expressly agree to follow, be
                            bound by, and adhere to these TOU and any Additional Terms in their entirety. If you do not
                            agree to these TOU and the applicable Additional Terms and all of the other policies and
                            terms referenced herein (“Terms and Conditions”) in their entirety, you are not authorized
                            to use the Sites in any manner or form whatsoever.

                            In the event that any of the terms, conditions, and notices contained herein conflict with
                            the Additional Terms or other terms and guidelines contained within any particular section
                            of the Sites or with any terms included with any product or service purchased from us, then
                            these TOU shall control and take precedence.
                        </p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">@lang('messages.close')</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<div class="modal fade" id="tandCModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title pull-left">
                    @lang('lang_v1.terms_conditions')
                </h4>

            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        {!! Form::checkbox('accept_tc', 0, false, ['required', 'class' => 'input-icheck accept_tc']);
                        !!}
                        <u><a class="terms_condition cursor-pointer" data-toggle="modal" data-target="#tc_modal">
                                @lang('lang_v1.accept_terms_and_conditions') <i></i>
                            </a></u>

                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="iagree">@lang('messages.agree')</button>
                <!--  <button type="button" class="btn btn-default" data-dismiss="modal">@lang('messages.close')</button> -->
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
