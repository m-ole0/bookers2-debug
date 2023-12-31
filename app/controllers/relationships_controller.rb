class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    following = current_user.followed.build(follower_id: params[:user_id])
    following.save
    redirect_to request.referrer || root_path
  end

  def destroy
    following = current_user.followed.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referrer || root_path
  end

end
