class UsersController < ApplicationController

  def create

    new_user = User.create(
      username: params["username"],
      email: params["email"],
      password: params["password"] # HAS TO BE password, not password_digest
    )

    redirect_to '/'
  end

  def index
    users = User.all
    # respond_to do |format|
    #   format.json { render :json => users}
    # end
    render :index, {locals: {users: users}}
  end

  def new
    render :signup
  end

  def show
    user = User.find(params[:id])
    events = Event.where({user_id: params[:id]})

    # respond_to do |format|
    #   format.json { render :json => user}
    # end

    render :show, {locals: {user: user, events: events}}
  end


end

