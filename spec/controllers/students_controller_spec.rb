require 'spec_helper'

describe StudentsController do

  login_user

  let(:user) { User.where(admin: true).first }

  let(:valid_attributes) { { name: "MyString", address: "MyString", state: "MyString", country: "MyString",
                             phone: "MyString", email: "MyString@mystring.com", zip: "45970", city: "Istanbul" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StudentsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all students as @students" do
      student = Student.create! valid_attributes
      get :index, {}, valid_session
      assigns(:students).should eq([student])
    end
  end

  describe "GET show" do
    it "assigns the requested student as @student" do
      student = Student.create! valid_attributes
      get :show, {:id => student.to_param}, valid_session
      assigns(:student).should eq(student)
    end
  end

  describe "GET new" do
    it "assigns a new student as @student" do
      get :new, {}, valid_session
      assigns(:student).should be_a_new(Student)
    end
  end

  describe "GET edit" do
    it "assigns the requested student as @student" do
      student = Student.create! valid_attributes
      get :edit, {:id => student.to_param}, valid_session
      assigns(:student).should eq(student)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Student" do
        expect {
          post :create, {:student => valid_attributes}, valid_session
        }.to change(Student, :count).by(1)
      end

      it "assigns a newly created student as @student" do
        post :create, {:student => valid_attributes}, valid_session
        assigns(:student).should be_a(Student)
        assigns(:student).should be_persisted
      end

      it "redirects to the created student" do
        post :create, {:student => valid_attributes}, valid_session
        response.should redirect_to(Student.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved student as @student" do
        # Trigger the behavior that occurs when invalid params are submitted
        Student.any_instance.stub(:save).and_return(false)
        post :create, {:student => { "name" => "invalid value" }}, valid_session
        assigns(:student).should be_a_new(Student)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Student.any_instance.stub(:save).and_return(false)
        post :create, {:student => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested student" do
        student = Student.create! valid_attributes
        # Assuming there are no other students in the database, this
        # specifies that the Student created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Student.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => student.to_param, :student => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested student as @student" do
        student = Student.create! valid_attributes
        put :update, {:id => student.to_param, :student => valid_attributes}, valid_session
        assigns(:student).should eq(student)
      end

      it "redirects to the student" do
        student = Student.create! valid_attributes
        put :update, {:id => student.to_param, :student => valid_attributes}, valid_session
        response.should redirect_to(student)
      end
    end

    describe "with invalid params" do
      it "assigns the student as @student" do
        student = Student.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Student.any_instance.stub(:save).and_return(false)
        put :update, {:id => student.to_param, :student => { "name" => "invalid value" }}, valid_session
        assigns(:student).should eq(student)
      end

      it "re-renders the 'edit' template" do
        student = Student.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Student.any_instance.stub(:save).and_return(false)
        put :update, {:id => student.to_param, :student => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested student" do
      student = Student.create! valid_attributes
      expect {
        delete :destroy, {:id => student.to_param}, valid_session
      }.to change(Student, :count).by(-1)
    end

    it "redirects to the students list" do
      student = Student.create! valid_attributes
      delete :destroy, {:id => student.to_param}, valid_session
      response.should redirect_to(students_url)
    end
  end

end
