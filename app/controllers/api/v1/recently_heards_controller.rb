module Api
  module V1
    class RecentlyHeardsController < ApplicationController
      def create
        @recently_heard = current_user.recently_heards.new(album_id: params[:album_id])
        @recently_heard.save
        head :ok
      end
    end
  end
end