class Comment < ActiveRecord::Base
  attr_accessible :post_id, :commenter_id, :text

  belongs_to :commenter, :class_name => "User", :foreign_key => :commenter_id
  belongs_to :post

  validates :post_id, :commenter_id, :text, :presence => true
end
