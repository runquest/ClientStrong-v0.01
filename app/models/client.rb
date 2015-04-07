class Client < ActiveRecord::Base
  has_many :workouts
  mount_uploader :avatar, AvatarUploader

  def self.search(query)
    where("name like ? OR email like ?", "%#{query}%", "%#{query}%")
  end

  scope :by_status, -> (status) { where(active: status) }
  
end




