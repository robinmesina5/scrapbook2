class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable, :recoverable, and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]

  has_many :relatives
  has_one :scrapbook

  def email_required?
  	false
  end

  def email_changed?
  	false
  end
end
