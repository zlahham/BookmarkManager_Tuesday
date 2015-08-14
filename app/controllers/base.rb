require 'sinatra/base'
require 'sinatra/flash'
require_relative '../../data_mapper_setup'

module Armadillo
  module Routes
    class Base < Sinatra::Base
      use Rack::MethodOverride
      register Sinatra::Flash
      set :views, proc { File.join(root, '..', 'views')}
      enable :sessions
      set :session_secret, 'super secret'

      helpers do
        def current_user
          @current_user ||= User.get(session[:user_id]) if session[:user_id]
        end
      end
    end
  end
end
