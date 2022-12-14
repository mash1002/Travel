class HomesController < ApplicationController
  def top
  end
  
  def guest_sign_in
    customer = Customer.find_or_create_by!(email: 'guest@example.com') do |customer|
    customer.password = SecureRandom.urlsafe_base64
    customer.user_name = "ゲスト"
      
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
