class SessionsController < Devise::SessionsController
  def ulogin
    require 'net/http'

    url = URI.parse("http://ulogin.ru/token.php?token=#{params[:token]}")

    social_info = ActiveSupport::JSON.decode(Net::HTTP.get(url))

    user = User.where("email = :email or uid = :uid", { :email => social_info["email"].downcase, :uid => social_info["uid"].downcase}).first

    if user.nil?
      user = User.new
      user.email = social_info["email"].downcase
      user.uid = social_info["uid"].downcase
      user.name = social_info["nickname"]
      user.password = params[:token]
      user.save!
      sign_in user, :bypass => true
    else
      sign_in user, :bypass => true
    end

    render json: {:status => "Ok", :userName => user.name }
  end

  def updateName
    user = current_user
    user.name = params[:name]
    if user.save
      render json: {:status => "Ok"}
    else
      user.reload
      render json: {:status => "Error", :userName => user.name}
    end
  end
end