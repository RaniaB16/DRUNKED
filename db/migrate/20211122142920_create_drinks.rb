class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.string :brand
      t.integer :quantity
      t.string :alcool_type
      t.integer :alcool_degree

      t.timestamps
    end
  end
end
