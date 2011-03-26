require "digest/sha2"
class User < ActiveRecord::Base
  
  has_many :tweets
  has_many :follows
  
  validates :username, :presence => true, :uniqueness => true
  validates :password, :length => { :minimum => 5 }, :confirmation => true
  
  attr_accessor :password, :password_confirmation
  
  before_save :encrypt_password
  
  def password_match?(password)
    self.password_hash == salt_and_password_to_hash(self.salt, password)
  end
  
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
  
  private

  def encrypt_password
    if self.password
      self.salt          = generate_salt
      self.password_hash = salt_and_password_to_hash(self.salt, self.password)
    end
  end

  def salt_and_password_to_hash(salt, password)
    encrypt("#{salt}#{password}")
  end

  def generate_salt
    encrypt("#{Time.now.to_s}#{self.username}")
  end

  def encrypt(string)
    Digest::SHA2.hexdigest(string)
  end


end
