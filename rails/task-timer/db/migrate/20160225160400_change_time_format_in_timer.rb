class ChangeTimeFormatInTimer < ActiveRecord::Migration
  def change
    change_column :timers, :start, :datetime
    change_column :timers, :finish, :datetime
  end
end
