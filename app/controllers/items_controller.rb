class ItemsController < ApplicationController
  skip_before_action :ensure_user_logged_in
end
