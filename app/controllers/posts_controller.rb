class PostsController < ApplicationController
  def new
  end

  def create
  	Message.publish_post('Hello World #{Time.now}', 1)
  end
end
