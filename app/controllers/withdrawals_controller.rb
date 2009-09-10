class WithdrawalsController < ApplicationController
  before_filter :require_card
  
  def create
    begin
      @transact=current_card.withdraw(params[:amount])
      flash[:notice] = "You successfully withdrew #{@transact['amount']}" if @transact["status"]=="ok"
    rescue
      flash[:error]="Something went wrong #{$!}"
    end
    redirect_to card_path
  end
end