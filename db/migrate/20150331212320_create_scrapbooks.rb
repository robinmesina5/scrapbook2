class CreateScrapbooks < ActiveRecord::Migration
	def change
		create_table :scrapbooks do |t|
			t.string   :name
			t.integer  :user_id
			t.integer  :admin_user_id
			t.integer  :relative_id

			t.timestamps null: false
		end
	end
end
