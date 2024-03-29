# frozen_string_literal: true

# Cars Controller (example of top-level documentation comment)
class CarsController < ApplicationController
  # authentication for functionality "Delete". Only Admin credentials can delete an object
  # http_basic_authenticate_with name: 'admin', password: '123456', only: :destroy

  before_action :set_car, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  # GET /cars or /cars.json
  def index
    @q = Car.ransack(params[:q]) ## adding Search funtionality using ransack gem
    @cars = @q.result ## display cars by results from @q
    # @cars = Car.all ## line commented after adding ransack search
  end

  # GET /cars/1 or /cars/1.json
  def show
    @q = Car.ransack(params[:q]) # adding Search funtionality using ransack gem
    @car = @q.result # display cars by results
    @car = Car.find(params[:id])
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
    @car = Car.find(params[:id])
  end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to car_url(@car), notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to car_url(@car), notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:carmodel, :brand, :year, :body, :price, :user_id, :status)
    # params.require(:car).permit(:brand, :carmodel, :year, :body, :price, :status)
    # params.require(:car).permit(:brand, :carmodel, :year, :body, :price)
  end
end
