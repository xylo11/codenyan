class RegistrationsController < Devise::RegistrationsController
  def update
    # パスワードのみの変更の場合、メールアドレスの変更を無視するために
    # パラメータからメールアドレスの値を削除します
    params[:user].delete(:email) if params[:user][:password].present? && params[:user][:email].blank?

    super
  end
end
