class ApplicationController < ActionController::Base
    def index 
    render({ :template => "users/all_users.html.erb"})
  end

  def sign_up
    render({ :template => "users/sign_up.html.erb"})
  end

  def sign_out
    reset_session

    redirect_to("/", { :notice => "See ya later!"})
  end

  def sign_in

    render({ :template => "users/sign_in.html.erb"})
  end

  def authenticate
    un = params.fetch("input_username")
    pw = params.fetch("input_password")

    user = User.where({ :username => un}).at(0)

    if user == nil
      redirect_to("/user_sign_in", { :alert => "No one by that name here"})
    else
      if user.authenticate(pw)
        session.store(:user_id, user.id)
        
        redirect_to("/", {:notice => "Welcome back " + user.username + "!" })
      else
      redirect_to("/user_sign_in", {:alert => "Nope"})
      end
    end
  end

  def create
    user = User.new

    user.username = params.fetch("input_username")
    user.password = params.fetch("input_password")
    user.password_confirmation = params.fetch("input_password_confirmation")

    save_status = user.save

    if save_status == true
      session.store( :user_id, user.id)

      redirect_to("/users/#{user.username}", { :notice => "Welcome, " + user.username + "!" })
    else
      redirect_to("/user_sign_up", { :alert => user.errors.full_messages.to_sentence})
    end
  end

  def show
    the_username = params.fetch("the_username")
    @user = User.where({ :username => the_username }).at(0)

    render({ :template => "users/show.html.erb" })
  end
end
