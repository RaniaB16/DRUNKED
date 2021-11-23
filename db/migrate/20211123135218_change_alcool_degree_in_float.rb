class ChangeAlcoolDegreeInFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :drinks, :alcool_degree, :float
  end
end
