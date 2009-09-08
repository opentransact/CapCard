class CardsController < ApplicationController
  before_filter :require_card, :only=>[:show,:destroy]
  before_filter :require_no_card, :only=>[:new,:create]
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

  def login
    @card=Card.first :conditions=>{:number=>params[:card][:number].gsub(/[^\d]/,''),:pin=>params[:card][:pin]}
    if @card
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