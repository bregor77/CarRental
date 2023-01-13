# frozen_string_literal: true

# Comments Controller (example of top-level documentation comment)
class CommentsController < ApplicationController
  # authentication for funtionality "Delete". Only moderator credentials can delete an object
  # http_basic_authenticate_with name: 'moderator', password: '123456', only: :destroy

  # Create Comments
  def create
    @car = Car.find(params[:car_id])
    @comment = @car.comments.create(comment_params)
    redirect_to car_path(@car)
  end

  # Delete Comments
  def destroy
    @car = Car.find(params[:car_id])
    @comment = @car.comments.find(params[:id])
    @comment.destroy
    redirect_to car_path(@car), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:customer, :body, :status)
  end
end
