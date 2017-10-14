class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  def index
    @conversations = Conversation.participating(current_user)
  end

  def show
    @message = Message.new(conversation_id: @conversation.id)
  end

  def new
  end

  def create
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end
end
