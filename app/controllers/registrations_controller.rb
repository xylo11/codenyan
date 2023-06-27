class RegistrationsController < Devise::RegistrationsController
  def update
    # パスワードのみの変更の場合、メールアドレスの変更を無視するために
    # パラメータからメールアドレスの値を削除します
    if params[:user][:password].present? && params[:user][:email].blank?
      params[:user].delete(:email)
    end

    super
  end
end