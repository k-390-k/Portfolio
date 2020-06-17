class SoundsController < ApplicationController
  def index
    @sounds = Sound.all
  end

  def show
    @sound = Sound.find(params[:id])
  end

  def new
    @sound = Sound.new
  end

  def create
    @sound =Sound.new(sound_params)
    
    #保存が成功した場合は、@soundで格納されたインスタンスの詳細画面に飛ぶ
    if @sound.save
      flash[:success] = "投稿完了しました！"
      redirect_to @sound
    else
      flash.now[:danger] ='投稿ができませんでした、、、'
      render :new
    end

  end

  def edit
    @sound = Sound.find(params[:id])
  end

  def update
  end

  def destroy
  end
end

#Soundモデルクラス以外では使用できないことを明示的にしている。
private

#ストロングパラメータ
def sound_params
  params.require(:sound).permit(:title,:description)
end