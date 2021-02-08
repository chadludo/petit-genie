class ProfilesController < ApplicationController
  def show
    @user = current_user
    @lists = List.all
  end
end
