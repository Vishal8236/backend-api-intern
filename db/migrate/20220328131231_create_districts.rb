class CreateDistricts < ActiveRecord::Migration[7.0]
  def change
    create_table :districts do |t|
      t.string :name
      t.references :states
    end
  end
end
