# frozen_string_literal: true

require 'test_helper'

class CarTest < ActiveSupport::TestCase
  # test 'the truth' do
  #   assert true
  # end
  
  test "should not save car without brand, model, year, body, price" do
    car = Car.new
    assert_not car.save, "Saved the car without brand, model, year, body, price"
  end
  
  # test "should report error" do
  #   # some_undefined_variable is not defined elsewhere in the test case
  #   some_undefined_variable
  #   assert true
  # end
  
  # test "should report error" do
  #   # some_undefined_variable is not defined elsewhere in the test case
  #   assert_raises(NameError) do
  #     some_undefined_variable
  #   end
  # end
  

  
  setup do
    sign_in users(:mariusz)
  end

  # test "redirected if not logged in" do
  #   sign_in :mariusz
  #   get cars_path
  #   assert_response :redirect
  #   follow_redirect!
  # end

  test "can get index" do
    get "/"
    assert_response :success
  end

  test "can get new" do
    get new_car_path
    assert_response :success
  end
end
