class PagesController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'Text/event-strem'

    5.times do |n|
      response.stream.write "Hello, browser! #{n + 1}\n"
      sleep 1
    end

    response.stream.close
  end
end
