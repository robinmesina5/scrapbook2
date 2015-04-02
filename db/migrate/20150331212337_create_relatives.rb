class CreateRelatives < ActiveRecord::Migration
  def change
    create_table :relatives do |t|
    	t.string   :first_name
			t.string   :last_name
			t.integer  :scrapbook_id
			t.string   :address, :default => "unknown"
			t.integer  :age
			t.string   :birthday
			t.string   :date_of_death, :default => "n/a"
			t.string   :father
			t.string   :mother
			t.string   :occupation, :default => "unknown"
			t.integer  :user_id
			t.string   :child_one
			t.string   :child_two
			t.string   :child_three
			t.string   :child_four
			t.string   :child_five
			t.string   :child_six
			t.text     :biography

      t.timestamps null: false
    end
  end
end
