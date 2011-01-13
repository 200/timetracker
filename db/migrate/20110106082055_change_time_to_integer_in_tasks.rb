class ChangeTimeToIntegerInTasks < ActiveRecord::Migration
  def self.up
    change_column :tasks, :time, :integer
  end

  def self.down
    change_column :tasks, :time ,:float
  end
end
