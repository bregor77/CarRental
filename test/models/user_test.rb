# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # user should not be added without required params
  test 'should not save without email and password' do
    user = User.new
    assert_not user.save
  end

  # # user should not be added without required params
  # # this test should be failed! (Let's comment it for pass model test)
  # test "should not save without email and password test2" do
  #   user = User.new
  #   assert user.save
  # end
end
