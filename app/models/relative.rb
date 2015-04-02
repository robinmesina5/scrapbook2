class Relative < ActiveRecord::Base
	has_attached_file :image, styles: { :large => "600x600>", :medium => "300x300>", :thumb => "150x150#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	belongs_to :scrapbook
	belongs_to :user
	belongs_to :admin_user
	belongs_to :mother, class_name: "Relative"
	belongs_to :father, class_name: "Relative"
	
	def children
		Relative.where("mother_id = ? or father_id = ?", id, id)
	end
end
