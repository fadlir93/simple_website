# frozen_string_literal: true

class Article < ActiveRecord::Base
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }, uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: { minimum: 3, }
  validates :user_id, presence: true
end
