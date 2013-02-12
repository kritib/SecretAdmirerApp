class Post < ActiveRecord::Base
  attr_accessible :poster_id, :recipient_id, :text

  belongs_to :poster, :class_name => "User", :foreign_key => :poster_id
  belongs_to :recipient, :class_name => "User", :foreign_key => :recipient_id

  has_many :comments

  validates :poster_id, :recipient_id, :text, :presence => :true
end
