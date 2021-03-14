class StaticPagesController < ApplicationController
  require 'flickr'
  #@@flickr = Flickr.new ENV['key'], ENV['secret']

  def index
    flickr = Flickr.new ENV['key'], ENV['secret']
    if params[:user] != nil && params[:user] != ''
      #if Flickr::FailedResponse  #flickr.people.getPhotos(user_id: params[:user])
       # @images = flickr.people.getPhotos(user_id: params[:user])
      #else
       # @images = nil
      #end
      begin 
        @images = flickr.people.getPhotos(user_id: params[:user])
      rescue Flickr::FailedResponse
        flash.now[:alert] = 'User not found or the user has no photos.'
        #render :index
      end
    else
      render :index
    end
  end

end
