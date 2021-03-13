class StaticPagesController < ApplicationController
  require 'flickr'
  @@flickr = Flickr.new ENV['key'], ENV['secret']

  def index
    if params[:user] != nil && params[:user] != ''
      @images = @@flickr.photos.search(user_id: params[:user])
    end
  end

end
