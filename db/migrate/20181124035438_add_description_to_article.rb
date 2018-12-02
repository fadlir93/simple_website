# frozen_string_literal: true

class AddDescriptionToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
    add_column :articles, :about, :text
  end
end
