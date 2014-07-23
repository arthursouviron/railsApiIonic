class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, only: [:show, :edit, :update, :destroy, :send_message]

  def show
    render :json => {
      :conversation => @conversation,
      :messages => @messages
    }
  end

  def create
    @conversation = Conversation.new
    @conversation.user_id = current_user.id
    @conversation.contact_index = params[:conversation][:contact_id]
    if @conversation.save
      render json: @conversation.to_json, status: :created
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end

  def send_message
    message = Message.new
    message.content = params[:message][:content]
    message.destination_id = params[:id]
    message.sender_id = current_user.id
    if message.save
      puts "MSG SAVED"
      GCM.host = 'https://android.googleapis.com/gcm/send'
      GCM.format = :json
      GCM.key = 'AIzaSyBOMiaIoMzzyV9Njche3PROmE5FKaqeOts'

      dest = User.find(params[:id])
      if dest.register_id_token
        puts "DEST HAS TOKEN =>>> #{dest.register_id_token}"
        GCM.send_notification(dest.register_id_token, {msgcnt: 3,title: 'Nouveau message', message: message.content, data: {sender_id: current_user.id}})
      end
      render json: message.to_json, status: :created
    else      
      render json: message.errors, status: :unprocessable_entity
    end

  end


  private

    def set_conversation
      @conversation = Conversation.where('user_id = ? AND contact_index = ?', params[:user_id], params[:id]).first()
      if !@conversation
        puts "CONVERS NULL"
        @conversation = Conversation.where('user_id = ? AND contact_index = ?', params[:id], params[:user_id]).first()
      end

      if @conversation
        puts "CONVERS FOUND"
        messages_sent = Message.where('sender_id = ? AND destination_id = ?', current_user.id, @conversation.contact_index)
        messages_received = Message.where('sender_id = ? AND destination_id = ?', @conversation.contact_index, current_user.id) 
        
        @messages = messages_sent + messages_received
        #@messages = (Message.where('sender_id = ? AND destination_id = ?', current_user.id, @conversation.contact_index) | Message.where('sender_id = ? AND destination_id = ?', @conversation.contact_index, current_user.id))
        @messages.sort! { |a, b| a.created_at <=> b.created_at }
        puts "MESSAGE =>> #{@messages.inspect}"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.require(:conversation).permit(:contact_index, :message)
    end


end