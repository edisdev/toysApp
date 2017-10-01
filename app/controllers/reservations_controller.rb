class ReservationsController < ApplicationController
  before_action :set_res, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @user= current_user.id

    @myres = Reservation.where(res_user_id: @user)

    @getres=  Reservation.where(toy_user_id: @user)
  end

  def new
  @toy = Toy.find(params[:toy_id])
  @res = Reservation.new
  end

  def create
  @res = Reservation.new(res_params)
  @toy = Toy.find(params[:toy_id])
  @res.toy_id = @toy.id
  @res.toy_user_id= @toy.user_id
  @res.res_user_id = current_user.id
  if @res.save
  redirect_to toy_path(@toy), notice: 'Oyuncak İçin Rezervasyonunuz Alındı .. Oyuncak Sahibinden ONay Beklenmektedir..'
  end
  end

def res_onay
@res = Reservation.find(params[:id])
@toy = @res.toy_id
@status=1

if @res.update(status: @status)
 redirect_to toy_path(@toy), notice: 'Oyuncağa ait Rezervasyon Onaylandı..'
end

end

def res_red
@res = Reservation.find(params[:id])
@toy = @res.toy_id
@status= -1

if @res.update(status: @status)
 redirect_to toy_path(@toy), notice: 'Oyuncağa ait Rezervasyon Reddedildi..'
end

end

private

  def set_res
  @res = Rezervation.find(params[:id])
  end
  def res_params
 params.require(:reservation).permit(:toy_id, :res_user, :res_note, :res_start_date, :res_finish_date , :toy_user_id)
  end
end
