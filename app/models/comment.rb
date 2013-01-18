class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :author, :class_name => "User"
  belongs_to :post

  attr_accessible :body
end
