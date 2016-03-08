class ChangeTimeFormatInTimer < ActiveRecord::Migration
  def up
    change_column :timers, :start, :datetime
    change_column :timers, :finish, :datetime
  end

  def down
    change_column :timers, :start, :time
    change_column :timers, :finish, :time
  end
end
