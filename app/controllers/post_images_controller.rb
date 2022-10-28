class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    # @post_image.user_id,つまりこの投稿の user_id としてcurrent_user.id の値を代入する、という意味
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  # saveメソッドはデータベースへレコードを保存するメソッドですが、メソッドの結果を同時に返してくれます。
  # 保存が成功した場合はtrue、失敗した場合はfalseを返します。


  def index
    @post_images = PostImage.page(params[:page])
    # pageメソッドは、kaminariをインストールしたことで使用可能になったメソッドです。
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
    # @post_comments = @post_image.post_comments
  end
  def destroy
    @post_image = PostImage.find(params[:id])
    # @post_image.user_id = current_user.id
    @post_image.destroy
    redirect_to post_images_path
  end
  private
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
