class MessagesController < ApplicationController
    before_action :authenticate_user!
    def create
      @message = current_user.messages.build(message_params)
      @message.room_id = params[:room_id]
      @message.save
      redirect_to root_path
    end

    def message_params
        params.require(:message).permit(:body)
    end
end