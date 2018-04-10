class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def show
    @ticket = Ticket.find(params[:id])
    respond_to do |format|
      render json: @ticket
    end
  end

  def create
    @ticket = Ticket.new(ticket_params)
    respond_to do |format|
      if @ticket.save
        format.json { render :show, status: :created, location: @ticket }
      else
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket = Ticket.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def ticket_params
      params.require(:ticket).permit(:description, :price, :event_id)
    end
end
