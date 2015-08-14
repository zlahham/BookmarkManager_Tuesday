require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative '../../data_mapper_setup'

module Armadillo
  module Routes
    class Base < Sinatra::Base
      use Rack::MethodOverride

      register Sinatra::Partial
      register Sinatra::Flash

      enable :sessions
      set :session_secret, 'super secret'

      enable :partial_underscores
      set :partial_template_engine, :erb

      helpers do
        def current_user
          @current_user ||= User.get(session[:user_id]) if session[:user_id]
        end
      end

      set :views, proc { File.join(root, '..', 'views') }
    end
  end
end
