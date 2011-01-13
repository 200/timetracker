class Task < ActiveRecord::Base
  validates_presence_of :name, :time
  validates_numericality_of :time, :only_integer => true

  has_many :reports, :dependent => :destroy

  def current_time
    self.reports.collect{|report| report.time}.sum
  end
end
