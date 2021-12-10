class SessionController < ApplicationController
  # def new
  # end
  def login
    user = User.find_by :email=>params[:email]
    if user && user.authenticate(params[:password])
      payload = {user_id: user.id}
      token = encode_token(payload)
      # user_json = user.to_json(:include => [
      #   :first_name, :last_name, :email])
      user_json = user.to_json()
      print(user_json)
      render json: {
        user: user_json,
        jwt: token
      }
    else 
      render json: {error: "We can't find a user according to your login information, please try again."}
    end
  end
  
  def auto_login
    if session_user
      render json: session_user, include: ['first_name', 'last_name', 'email']
    else
      render json: {errors: "No User Logged In!"}
    end
  end

end