module Armadillo
  module Routes
    class Sessions < Base
      get '/sessions/new' do
        erb :'sessions/new'
      end

      post '/sessions' do
        user = User.authenticate(params[:email], params[:password])
        if user
          session[:user_id] = user.id
          redirect('/links')
        else
          flash.now[:errors] = ['The email or password is incorrect']
          erb :'sessions/new'
        end
      end

      delete '/sessions' do
        flash.now[:notice] = 'Goodbye!'
        session[:user_id] = nil
        erb :'sessions/new'
      end
    end
  end
end
