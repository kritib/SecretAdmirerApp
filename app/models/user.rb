class User < ActiveRecord::Base
  attr_accessible :username, :session_token

  has_many :posted_posts, :class_name => "Post", :foreign_key => :poster_id
  has_many :received_posts, :class_name => "Post", :foreign_key => :recipient_id
  has_many :comments, :foreign_key => :commenter_id

  has_many :admirers, :through => :received_posts, :source => :posters,
                      :uniq => true

  validates :username, :uniqueness => true, :presence => :true

  def create_token
    token = SecureRandom.hex
    self.session_token = token
    if self.save
      token
    else
      false
    end
  end

  def delete_token
    self.session_token = nil
  end

end
