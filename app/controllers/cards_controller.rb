class CardsController < ApplicationController
  
  def new
    @card=Card.new
  end
  
  def create
    @card=Card.new params[:card]
    if @card.save
      session[:card]=@card.key
      redirect_to card_path
    else
      render :template=>:new
    end
  end
  
  def show
    redirect_to new_card_path unless current_card
  end
  
  def destroy
    session[:card]=nil
    redirect_to new_card_path
  end
  
end