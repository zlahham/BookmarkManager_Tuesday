module Armadillo
  module Routes
    class Index < Base
      get '/' do
        erb :welcome
      end
    end
  end
end
