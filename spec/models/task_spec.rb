require "spec_helper"

describe Task do
  describe "current_time" do
    before(:each) do
      @task = Factory(:task)
      @report1 = Factory(:report, :task => @task)
      @report2 = Factory(:report, :task => @task)
    end
    it { @task.current_time.should == @report1.time + @report2.time }
  end
end
