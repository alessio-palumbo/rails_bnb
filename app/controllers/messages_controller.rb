class MessagesController < ApplicationController
  before_action :find_conversation!

  def new
    redirect_to conversation_path(@conversation) and return if @conversation
    @message = Message.new
  end

  def create
    @conversation ||= Conversation.create!(guest_id: current_user.id, host_id: @host.id) 
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.conversation_id = @conversation.id

    respond_to do |format|
      if @message.save!
        format.html { redirect_to @conversation }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private 

  def message_params
    params.require(:message).permit(:body)
  end

  def find_conversation!
    if params[:host_id]
      @host = User.find_by(id: params[:host_id])
      redirect_to(listings_path) and return unless @host
      @conversation = Conversation.where(guest_id: current_user.id, host_id: @host.id).first
    else
      @conversation = Conversation.find_by(id: params[:conversation_id])
      redirect_to(listings_path) and return unless @conversation
      #  && @conversation.participates?(current_user)
    end
  end
end

