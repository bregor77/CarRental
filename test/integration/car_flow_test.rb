require "test_helper"

class CarFlowTest < ActionDispatch::IntegrationTest
  
  setup do
    sign_in users(:mariusz)
    @car = cars(:two)
  end
  
  test "can see the welcome page" do
    get "/"
    assert_select "h1", "Car Rental Home Page"
  end

  test "can show car list" do
    get cars_url
    assert_response :success
  end  

  test "car has show button" do    
    get cars_path   
    assert_select 'a', 'Show this car', 1
  end    
end
