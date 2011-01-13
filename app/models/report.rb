class Report < ActiveRecord::Base
  validates_presence_of :task, :time
  validates_numericality_of :time, :only_integer => true

  belongs_to :task
end
