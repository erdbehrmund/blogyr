class Post < ActiveRecord::Base
  attr_accessible :body, :friendly_url, :show, :title

  validates_presence_of :body, :title
end
