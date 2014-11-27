class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @company = current_user.company
  end
  def learn_more
    # respond_to do |format|
    #   format.js
    # end
  end
end
