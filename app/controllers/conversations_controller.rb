class ConversationsController < ApplicationController  
    def index
      @users = User.all
      @conversations = Conversation.all
    end  
    
    def create  
      if Conversation.between(params[:sender_id], params[:recipient_id]).present? 
         @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
      else
         @conversation = Conversation.create!(conversation_params)
      end    
      redirect_to conversation_messages_path(@conversation)
    end  

    def destroy
      @conversation = Conversation.find(params[:id])
      @conversation.destroy
    
    flash[:success] = "Conversation deleted."
    redirect_to root_path
    end
    
    private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end
  end


