# frozen_string_literal: true

# class AddStatusToComments (example of top-level documentation comment)
class AddStatusToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :status, :string
  end
end
