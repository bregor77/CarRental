# frozen_string_literal: true

require 'test_helper'

class CarTest < ActiveSupport::TestCase
  setup do
    sign_in users :mariusz
  end

  # new car without params should not be added
  test 'should not save car without brand, model, year, body, price' do
    car = Car.new
    assert_not car.save, 'Saved the car without brand, model, year, body, price'
  end

  # some_undefined_variable is not defined elsewhere in the test case
  test 'should not report error' do
    assert_raises(NameError) do
      some_undefined_variable
      assert_not true
    end
  end

  # # some_undefined_variable is not defined elsewhere in the test case
  # # this test should give an error! (Let's comment it for no errors in tests)
  # test "should report error" do
  #   some_undefined_variable
  #   assert true
  # end
end
