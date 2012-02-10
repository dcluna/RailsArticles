class Tag < ActiveRecord::Base
  has_many :classifications
  has_many :posts, :through => :classifications
end
