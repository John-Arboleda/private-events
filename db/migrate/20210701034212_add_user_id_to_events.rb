# frozen_string_literal: true

class AddUserIdToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :user_id, :integer
  end
end
