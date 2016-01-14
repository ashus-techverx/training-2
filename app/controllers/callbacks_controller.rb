class CallbacksController < Devise::OmniauthCallbacksController
	skip_before_filter  :verify_authenticity_token
    def facebook
    
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user, :event => :authentication
    end
end