# frozen_string_literal: true

# class AddStatusToCars (example of top-level documentation comment)
class AddStatusToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :status, :string
  end
end
