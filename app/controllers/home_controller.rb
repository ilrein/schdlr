class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    #@company = current_user.company
  end
end
