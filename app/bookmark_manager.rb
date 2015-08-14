require 'sinatra/base'
require 'sinatra/flash'
require './app/controllers/base'
require './app/controllers/links_controllers'
require './app/controllers/tags_controllers'
require './app/controllers/users_controllers'
require './app/controllers/sessions_controllers'
require './app/controllers/index_controllers'
require_relative '../data_mapper_setup'

module Armadillo
  class BookmarkManager < Sinatra::Base

    use Routes::Index
    use Routes::Links
    use Routes::Tags
    use Routes::Sessions
    use Routes::Users
    
    run! if app_file == $PROGRAM_NAME
  end
end
