<div class="modal" tabindex="-1" role="dialog" id="orderCall">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <div class="heading">
                    <h3 class="modal-title">{{ trans('vars.header/footer.orderCall') }}</h3>
                </div>
            </div>
            <div class="modal-body contacts">
                <div class="">
                    <div class="contact-form row">
                        <form method="POST" action="{{ url('/'.$lang->lang.'/order-call') }}" class="_submit-form">
                            {{ csrf_field() }}
                            <input type="hidden" name="agent_email" value="{{ $agentEmail }}">
                            <input type="hidden" name="url" value="{{ url()->current() }}">
                            <div class="col-md-12">
                                <input type="text" placeholder="{{ trans('vars.header/footer.name') }}*" name="name" required>
                            </div>
                            <div class="col-md-12">
                                <input type="email" placeholder="{{ trans('vars.header/footer.email') }}*" name="email" required>
                            </div>
                            <div class="col-md-12">
                                <input type="number" placeholder="{{ trans('vars.header/footer.phone') }}*" name="phone" required>
                            </div>
                            <div class="col-md-12">
                                <select name="contact_method">
                                    <option value="">{{ trans('vars.header/footer.methodOfCommunication') }}</option>
                                    <option value="Telefon">{{ trans('vars.header/footer.phone') }}</option>
                                    <option value="Telegram">Telegram</option>
                                    <option value="Whatsapp">Whatsapp</option>
                                    <option value="Viber">Viber</option>
                                </select>
                            </div>
                            <div class="col-md-12">
                                <input type="submit" class="_submit-btn" value="{{ trans('vars.header/footer.requestNow') }}">
                                <div class="_loader">
                                    <div class="loader ">Loading...</div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@if(Session::has('success'))
    <div class="modal" tabindex="-1" role="dialog" id="thanksMessage">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <div class="heading">
                        <h3 class="modal-title">{{ trans('vars.notifications.successfullyMessage') }}</h3>
                    </div>
                </div>
                <div class="modal-body contacts">
                    <div class="">
                        <div class="contact-form row text-center">
                            <h4>{{ Session::get('success') }}</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endif
