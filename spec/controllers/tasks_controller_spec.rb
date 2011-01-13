require 'spec_helper'

describe TasksController do

  describe "GET #index" do
    before(:each) do
      @tasks = [mock_model(Task), mock_model(Task)]
      Task.stub!(:all).and_return(@tasks)    
      get :index
    end
    it { assigns(:tasks).should eq(@tasks) }
    it { assert_template("index")}
  end

  describe "GET #new" do
    before(:each) do
      get :new
    end
    
    it { assert_template("new")}
  end

  describe "POST #create" do
    before(:each) do
      @task = mock_model(Task)
    end
    
    describe "success" do
      before(:each) do
        @task.stub!(:save).and_return(true)
        Task.stub!(:new).and_return(@task)
        post :create
      end
      it { assigns(:task).should eq(@task)}
      it { response.should redirect_to(root_url)}
      it { controller.flash[:notice].should == "Task created!"}
    end
    describe "failure" do
      before(:each) do
        @task.stub!(:save).and_return(false)
        Task.stub!(:new).and_return(@task)
        post :create
      end
      it { assigns(:task).should eq(@task)}
      it { assert_template("new")}
    end
  end 

  describe "DELETE #destroy" do
    before(:each) do
      @task = mock_model(Task)
      Task.stub!(:find).and_return(@task)
      delete :destroy, :id => @task.id
    end
    it { assigns(:task).should eq(@task)}
    it { response.should redirect_to(root_url)}
    it { controller.flash[:notice].should == "Task deleted!"}
  end

end
