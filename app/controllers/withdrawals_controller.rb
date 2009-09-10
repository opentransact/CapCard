class WithdrawalsController < ApplicationController
  before_filter :require_card
  
  def create
    begin
      @transact=JSON.parse(current_card.client.post("/transacts",{:amount=>params[:amount],:memo=>"Withdrawal",:to=>OPERATOR_ACCOUNT},{'Accept'=>'application/json'}).body)
      flash[:notice] = "You successfully withdrew #{@transact['amount']}" if transact["status"]=="ok"
    rescue
      flash[:error]="Something went wrong"
    end
    redirect_to card_path
  end
end