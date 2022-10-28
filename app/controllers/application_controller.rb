class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:top]

    # ログイン認証が済んでいない状態でトップページ以外の画面にアクセスしても、ログイン画面へリダイレクトするようになります。 また、ログイン認証が済んでいる場合には全てのページにアクセスすることができます。
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        post_images_path
    end
    def after_sign_out_path_for(resource)
        homes_about_path
    end
    protected


    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end

# このように記述することで、devise利用の機能（ユーザ登録、ログイン認証など）が使われる前に
# configure_permitted_parametersメソッドが実行されます。
# ※「Sign up」はユーザ登録、「Sign in」はログインのこと
# デフォルトではユーザ登録後の遷移先はルートパスになっています。
# また、ユーザ登録後はログイン状態にあります。