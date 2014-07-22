class MessageController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]


  def index
    @messages = Message.where('conversation_id == ?', message_params[:conversation_id])
    render json: @messages.to_json
  end


  def create
    @message.conversation_id = params[:id]
    if @message.save
      render json: @message.to_json, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end


  private

    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content)
    end


end