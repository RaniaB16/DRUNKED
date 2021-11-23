class AddColumnsStartDateToMeetings < ActiveRecord::Migration[6.1]
  def change
    add_column :meetings, :start_date, :datetime
    add_column :meetings, :end_date, :datetime
  end
end
