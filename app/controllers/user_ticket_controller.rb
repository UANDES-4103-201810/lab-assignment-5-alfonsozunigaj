class UserTicketController < ApplicationController
  before_action :set_user_ticket, only: [:show, :update, :destroy]

  def new
    @user_ticket = UserTicket.new
  end

  def show
    @user_ticket = UserTicket.find(params[:id])
    respond_to do |format|
      render json: @user_ticket
    end
  end

  def create
    @user_ticket = UserTicket.new(user_params)
    respond_to do |format|
      if @user_ticket.save
        format.json { render :show, status: :created, location: @user_ticket }
      else
        format.json { render json: @user_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_ticket = UserTicket.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @user_ticket.update(user_ticket_params)
        format.json { render :show, status: :ok, location: @user_ticket }
      else
        format.json { render json: @user_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user_ticket = UserTicket.find(params[:id])
  end

  def user_ticket_params
    params.require(:user_ticket).permit(:user_id, :ticket_id, :time, :paid)
  end

end
