class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :follow
end
