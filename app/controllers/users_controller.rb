class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(params[:name], params[:last_name], params[:email], params[:phone], params[:password], params[:address])
    respond_to do |format|
      if @user.save
        format.json { render :show, status: :created, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.json { render :show, status: :ok, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def more_tickets_bought
    all_sales = UserTicket.all
    people_amount = {}
    all_sales.each {|sale|
      unless people_amount.key?(sale.user_id)
        people_amount[sale.user_id] = all_sales.count {|x| x['user_id'] == sale.user_id}
      end
    }
    people_amount.sort_by {|_key, value| value}.reverse.to_h
    keys = people_amount.keys
    result = {}
    (0..10).each do |n|
      result[keys[n]] = people_amount[keys[n]]
    end

    return result.to_json
  end

  def set_user
    @user = User.find(params[:id])
  end
end
