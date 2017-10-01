class MessagesController < ApplicationController
before_action :set_user , except: [:index]
before_action :authenticate_user!

def index
  @cuser = current_user.id
  @messages= Message.where(whose_id: @cuser).order("created_at DESC")
end

  def new
  @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    @message.whose_id = @user.id
    if @message.save
      redirect_to user_path(@user.id), notice: 'Kullanıcıya Mesajınız Gönderilmiştir .. '
    else
      render 'new'
    end
  end

private

def set_user
  @user = User.find(params[:user_id])
end
  def message_params
    params.require(:message).permit(:subject,:message,:sender_id,:whose_id)
  end
end
