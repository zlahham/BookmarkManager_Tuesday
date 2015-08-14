require 'sinatra/base'
require 'sinatra/flash'
require_relative './controllers/links'
require_relative './controllers/tags'
require_relative './controllers/users'
require_relative './controllers/sessions'
require_relative './controllers/index'


require_relative '../data_mapper_setup'

class BookmarkManager < Sinatra::Base
  use Rack::MethodOverride

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end
  end

  run! if app_file == $PROGRAM_NAME
end
