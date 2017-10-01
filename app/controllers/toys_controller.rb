class ToysController < ApplicationController
before_action :find_toy, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user! , except: [:index]

def index
@toys= Toy.order("created_at DESC")

end

def mytoys
  @toys= Toy.where(user_id: current_user.id)
end

def new
@toy= current_user.toys.build
end

def show

  @id= @toy.id
  @res = Reservation.where(toy_id: @id)
end

def edit
end

def create
@toy = current_user.toys.build(toy_params)

if @toy.save
redirect_to toy_path(@toy), notice: 'Oyuncağınızı Eklendiniz.'
end
end

def update
if @toy.update(toy_params)
redirect_to toy_path(@toy), notice: 'Oyuncak Bilgileriniz Güncellendi.'
else
render :edit
end
end

def destroy
  @toy.destroy
  redirect_to mytoys_path, notice: 'Oyuncağınız Silindi.'
end

private
def find_toy
@toy = Toy.find(params[:id])
end

def toy_params
params.require(:toy).permit(:name, :toy_type, :description, :image, :status, :user_id)
end
end
