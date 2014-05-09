class MessagesController < ApplicationController
  before_action :set_student
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = @student.messages.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = @student.messages.new
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = @student.messages.new(message_params)
    @message.user_id = current_user.id

    respond_to do |format|
      if @message.save
        format.html { redirect_to [@student, @message], notice: 'Message was successfully created.' }
        format.json { render action: 'show', status: :created, location: @message }
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to student_messages_url(@student) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = @student.messages.find(params[:id])
    end

    def set_student
      @student = Student.find(params[:student_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:title, :content, attachments_attributes: [:file])
    end
end
