require 'spec_helper'

describe MessagesController do
  login_user
  let(:user) { User.where(admin: true).first }
  let(:student) { FactoryGirl.create :student }
  let(:valid_attributes) { { title: "Message Title", content: "Content", student_id: student.id, user_id: user.id } }


  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MessagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all messages as @messages" do
      message = Message.create! valid_attributes
      get :index, student_id: student.id
      assigns(:messages).should eq([message])
    end
  end

  describe "GET show" do
    it "assigns the requested message as @message" do
      message = Message.create! valid_attributes
      get :show, {:id => message.to_param, student_id: student.id}, valid_session
      assigns(:message).should eq(message)
    end
  end

  describe "GET new" do
    it "assigns a new message as @message" do
      get :new, {student_id: student.id}, valid_session
      assigns(:message).should be_a_new(Message)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Message" do
        expect {
          post :create, {:message => valid_attributes, student_id: student.id}, valid_session
        }.to change(Message, :count).by(1)
      end

      it "assigns a newly created message as @message" do
        post :create, {:message => valid_attributes, student_id: student.id}, valid_session
        assigns(:message).should be_a(Message)
        assigns(:message).should be_persisted
      end

      it "redirects to the created message" do
        post :create, {:message => valid_attributes, student_id: student.id}, valid_session
        response.should redirect_to(student_message_url(student, Message.last))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved message as @message" do
        # Trigger the behavior that occurs when invalid params are submitted
        Message.any_instance.stub(:save).and_return(false)
        post :create, {:message => { "student" => "invalid value"} , student_id: student.id}, valid_session
        assigns(:message).should be_a_new(Message)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Message.any_instance.stub(:save).and_return(false)
        post :create, {:message => { "student" => "invalid value"} , student_id: student.id}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested message" do
      message = Message.create! valid_attributes
      expect {
        delete :destroy, {:id => message.to_param, student_id: student.id}, valid_session
      }.to change(Message, :count).by(-1)
    end

    it "redirects to the messages list" do
      message = Message.create! valid_attributes
      delete :destroy, {:id => message.to_param, student_id: student.id}, valid_session
      response.should redirect_to(student_messages_url(student))
    end
  end

end
