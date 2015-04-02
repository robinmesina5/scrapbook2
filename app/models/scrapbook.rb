class Scrapbook < ActiveRecord::Base
	belongs_to :user
	has_many :relatives, through: :user
end
