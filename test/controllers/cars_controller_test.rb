# frozen_string_literal: true

require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:mariusz)
    @car = cars(:one)
  end

  test 'should get index' do
    sign_out users(:mariusz)

    get cars_url
    assert_response :success
  end

  test 'should get new if signed in' do
    get new_car_url
    assert_response :success
  end
  
  test "should not get new if signed out" do
    sign_out users(:mariusz)
    get new_car_url
    assert_response :redirect
  end

  test 'should create car' do
    assert_difference('Car.count') do
    post cars_url, params: { car: { brand: @car.brand, carmodel: @car.carmodel, body: @car.body, price: @car.price, year: @car.year, status: @car.status } }
    # post cars_url, params: { car: { brand: @car.brand, carmodel: @car.carmodel, body: @car.body, price: @car.price, year: @car.year } }
    end

    assert_redirected_to car_url(Car.last)
  end

  test 'should show car' do
    get car_url(@car)
    assert_response :success
  end

  test 'should get edit' do
    get edit_car_url(@car)
    assert_response :success
  end

  test 'should update car' do
    patch car_url(@car), params: { car: { brand: @car.brand, carmodel: @car.carmodel, body: @car.body, price: @car.price, year: @car.year, status: @car.status } }
    # patch car_url(@car), params: { car: { brand: @car.brand, carmodel: @car.carmodel, body: @car.body, price: @car.price, year: @car.year } }
    assert_redirected_to car_url(@car)
  end

  test 'should destroy car' do
    assert_difference('Car.count', -1) do
      delete car_url(@car)
    end

    assert_redirected_to cars_url
  end
end
