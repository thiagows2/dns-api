# frozen_string_literal: true

class CreateHostnames < ActiveRecord::Migration[6.1]
  def change
    create_table :hostnames do |t|
      t.string :hostname
      t.integer :dns_record_count, default: 0

      t.timestamps
    end
  end
end
