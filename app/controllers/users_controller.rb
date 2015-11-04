class UsersController < ApplicationController
  def show
    @user =User.find(paramas[:id])
  end
end
