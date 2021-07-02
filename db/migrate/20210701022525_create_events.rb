# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
