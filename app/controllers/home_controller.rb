class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    if current_user
      if current_user.user_type == "owner"
        render "owner"
      else
        render "dashboard"
      end
    else
      render "index"
    end
  end
end
