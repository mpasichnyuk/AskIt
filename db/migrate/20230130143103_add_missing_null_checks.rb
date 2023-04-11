# frozen_string_literal: true

class AddMissingNullChecks < ActiveRecord::Migration[6.1]
  def change
    change_column_null :questions, :title, false
  end
end
