module Api
  module V1
    class SearchController < ApplicationController

      def name
        @songs = Song.where('title iLIKE ?', "%#{params[:query]}%")
        @songs = Album.where('title iLIKE ?', "%#{params[:query]}%")
        @songs = Artist.where('name iLIKE ?', "%#{params[:query]}%")
      end
      
    end
  end
end