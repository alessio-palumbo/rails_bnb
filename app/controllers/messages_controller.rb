class MessagesController < ApplicationController
  before_action :find_conversation!

  def new
  end

  def create
    # @conversation |= Conversation.create!(guest_id: current_user.id, host_id: @listing.host_id)
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
    @conversation = Conversation.find_by(id: params[:conversation_id])
    redirect_to(conversations_path) and return unless @conversation
  end
end
