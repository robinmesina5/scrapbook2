class ChangeRelativesTable < ActiveRecord::Migration
  def change
  	change_table :relatives do |t|
  		t.integer :father_id
  		t.integer :mother_id

  		t.remove :father
  		t.remove :mother
  		t.remove :child_one
  		t.remove :child_two
  		t.remove :child_three
  		t.remove :child_four
  		t.remove :child_five
  		t.remove :child_six
  	end
  end
end
