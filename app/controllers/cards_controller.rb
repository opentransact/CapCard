class CardsController < ApplicationController
  before_filter :require_card, :only=>[:show,:destroy]
  before_filter :require_no_card, :only=>[:new,:create]
  def new
    @card=Card.new
  end
  
  def create
    @card=Card.new params[:card]
    if @card.save
      flash[:notice]="Your card has hereby been issued"
      session[:card]=@card.key
      redirect_to card_path
    else
      render :template=>:new
    end
  end

  def cap
    @card=Card.find_by_key params[:id]
    if @card
      flash[:notice]="You have been logged in to use your card"
      session[:card]=@card.key
      redirect_to card_path
    else
      flash[:error]="The card doesn't exist. Try applying for a new one."
      render :template=>:new
    end
      
  end

  def login
    @card=Card.first :conditions=>{:number=>params[:card][:number].gsub(/[^\d]/,''),:pin=>params[:card][:pin]}
    if @card
      flash[:notice]="You have been logged in to use your card"
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