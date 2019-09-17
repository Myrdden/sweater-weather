class UsersController < Sinatra::Base
  post '/api/v1/users' do
    strong_params = ['email', 'password', 'password_confirmation']
    body = JSON.parse(request.body.read).symbolize_keys
    user_params = body.keep_if {|k,v| strong_params.include?(k)}
    user = User.new(user_params)
    if user.save
      json user.api_key
    else
      status 400
    end
  end

  post '/api/v1/sessions' do
    strong_params = ['email', 'password']
    body = JSON.parse(request.body.read).symbolize_keys
    user_params = body.keep_if {|k,v| strong_params.include?(k)}
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      json user.api_key
    else
      status 403
    end
  end

  # private
  # def user_params(input)
  #   params = ['email', 'password', 'password_confirmation']
  #   input.keep_if {|k,v| params.include?(k)}
  # end
end
