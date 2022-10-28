class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
    # 結果的に、全体の投稿ではなく、個人が投稿したもの全てを表示できます。
  end

  def edit
    @user = User.find(params[:id])
  end
end
# ユーザーの詳細ページでは、ユーザー情報に加えて、ユーザーが投稿したPostImageモデルの一覧も詳細ページに表示させていきます。

# @user.post_imagesに格納されているデータは複数あるため
# @post_images.user.id,@post_images.user.nameのように
# 関連づけられているモデルのカラムを操作することはできません。
# each文を使用して、一つずつデータを確認した上で、カラムを操作する必要があります。