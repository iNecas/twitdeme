class User < ActiveRecord::Base
  
  has_many :tweets
  has_many :follows
  
  validates :username, :presence => true, :uniqueness => true
  validates :password, :length => { :minimum => 5 }
  
  def follows
    folls = Follow.where(:user_id => self.id).all
    following = []
    folls.each do |f|
      following << f.follow_id
    end
    User.where(:id => following).all
  end
  
  def follow_tweets
    #puts Follow.where(:user_id => self.id).select(:follow_id).all.to_a.inspect
    Tweet.where(:user_id => self.follows).all
  end
  
end
