class CreateParties < ActiveRecord::Migration[6.1]
  def change
    create_table :parties do |t|
      t.string :name
       t.references :user

      t.timestamps
    end
  end
end
