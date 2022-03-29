class CreateChildren < ActiveRecord::Migration[7.0]
  def change
    create_table :children do |t|
      t.string :name
      t.integer :sex
      t.date :dob
      t.string :father_name      
      t.string :mother_name
      t.integer :district_id
      t.string :photo 
    end
  end
end
