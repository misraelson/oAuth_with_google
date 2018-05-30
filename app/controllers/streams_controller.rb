class StreamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @props = {
      # broadcasts: @broadcasts.items,
      broadcasts: [],
      current_user: current_user
    }
  end
end
