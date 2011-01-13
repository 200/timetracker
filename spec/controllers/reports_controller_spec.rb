require 'spec_helper'

describe ReportsController do
  before(:each) do
    @task = Factory(:task)
    Task.stub!(:find).and_return(@task)
  end
  describe "GET #new" do
    before(:each) do
      get :new, :task_id => @task.id
    end
    it { assert_template ("new")}
  end
  describe "POST #create" do
    before(:each) do
       @report = Factory(:report, :task => @task)
    end
    describe "success" do
      before(:each) do 
        @report.stub!(:save).and_return(true)
        @task.reports.stub!(:new).and_return(@report)
        post :create, :task_id => @task.id
      end
      it { assigns(:report).should == @report }
      it { response.should redirect_to(task_url(@task)) }
      it { controller.flash[:notice].should == "Report created!" }
    end
    describe "failure" do
      before(:each) do
        @report.stub!(:save).and_return(false)  
        @task.reports.stub!(:new).and_return(@report)
        post :create, :task_id => @task.id
      end
      it { assigns(:report).should == @report }
      it { assert_template "new" }
    end
    describe "DELETE #destroy" do
      before(:each) do
        @report = Factory(:report, :task => @task)
        @task.reports.stub!(:find).and_return(@report)
        delete :destroy, :task_id => @task.id, :id => @report.id
      end
      it { response.should redirect_to(task_path(@task))}
      it { controller.flash[:notice].should == "Report deleted!" }
    end
  end
end
