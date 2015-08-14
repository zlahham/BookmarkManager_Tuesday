module Armadillo
  module Routes
    class Tags < Base
      get '/tags/:name' do
        tag = Tag.all(name: params[:name])
        @links = (tag ? tag.links : [])
        erb :'links/index'
      end
    end
  end
end
