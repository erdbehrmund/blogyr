class Post < ActiveRecord::Base
  attr_accessible :body, :friendly_url, :show, :title, :categories, :category_ids

  validates_presence_of :body, :title

  has_and_belongs_to_many :categories
end
