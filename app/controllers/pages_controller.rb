class PagesController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'

    3.times do |n|
      response.stream.write "Hello, browser! #{n + 1}\n"
      sleep 1
    end

    response.stream.close
  end

  def index2
  end

  def items
    response.headers['Content-Type'] = 'text/event-stream'

    redis = Redis.new

    redis.subscribe('pages.items') do |on|
      on.message do |event, data|
        response.stream.write("data: #{data}\n\n")
      end
    end

    response.strem.close
  end
end
