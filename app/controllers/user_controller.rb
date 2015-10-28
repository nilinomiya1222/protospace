class UserController < ApplicationController
  def show
    @user =User.find(paramas[:id])
  end
end