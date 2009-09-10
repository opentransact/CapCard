class OauthController < ApplicationController
  before_filter :require_card
  
  # creates request token and redirects on to oauth provider's auth page
  # If user is already connected it displays a page with an option to disconnect and redo
  def show
    unless current_card.token
      @request_token=Card.get_request_token(oauth_callback_url(:only_path=>false))
      session[@request_token.token]=@request_token.secret
      if @request_token.callback_confirmed?
        redirect_to @request_token.authorize_url
      else
        redirect_to(@request_token.authorize_url + "&oauth_callback=#{oauth_callback_url(:only_path=>false)}")
      end
    end
  end

  def callback
    @request_token_secret=session[params[:oauth_token]]
    if @request_token_secret
      @token=current_card.exchange_request_token!(params[:oauth_token],@request_token_secret,params[:oauth_verifier])
      if @token
        flash[:notice] = "#{OPEN_TRANSACT_NAME} was successfully linked to your card"
        redirect_to card_path
      else
        flash[:error] = "An error happened, please try connecting again"
        redirect_to card_path
      end
    end
  end
  
end