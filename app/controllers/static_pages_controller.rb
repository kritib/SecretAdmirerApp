class StaticPagesController < ApplicationController

  skip_before_filter :require_login

  def index
    @current_user = current_user
  end
end
