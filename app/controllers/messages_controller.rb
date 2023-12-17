class MessagesController < ApplicationController
  before_action :correct_user


  before_action do
      @conversation = Conversation.find(params[:conversation_id])    
    end
    
    def index
      @messages = @conversation.messages
      @message = @conversation.messages.new
    end  
    
    def new
      @message = @conversation.messages.new
    end  
    
    def create
      @message = @conversation.messages.new(message_params)
      if @message.save
        redirect_to conversation_messages_path(@conversation)
      end
    end  
    
    private
    def message_params
      params.require(:message).permit(:body, :user_id)
    end



    def correct_user
      @user = Conversation.find(params[:conversation_id]).sender_id
      @user1 = Conversation.find(params[:conversation_id]).recipient_id

      redirect_to(root_path) unless current_user.id == @user || current_user.id == @user1
    end
  end
  