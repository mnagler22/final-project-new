class ApplicationController < ActionController::Base
  def index 
    @users = User.all
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
        session.store(:user_username, user.username)
        
        redirect_to("/users/#{user.username}", {:notice => "Welcome back " + user.username + "!" })
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
      session.store( :user_username, user.username)

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

  def update
    the_id = params.fetch("the_user_id")
    user = User.where({ :id => the_id }).at(0)


    user.username = params.fetch("input_username")

    user.save
    
    redirect_to("/users/#{user.username}", { :notice => "Username updated to: " + user.username + "!" })
  end

  def destroy
    the_id = params.fetch("the_user_id")
    user = User.where({ :id => the_id }).at(0)

    user.destroy

    reset_session

    redirect_to("/users", { :notice => "Username: *" + user.username + "* has been deleted!" })
  end

  def login_confirmation
    render({ :template => "users/login_confirmation.html.erb"})
  end

  def my_page
    render({ :template => "users/my_page.html.erb" })
  end

  #course fcns

  def course_index
    @users = User.all
    render({ :template => "courses/index.html.erb"})
  end


  def new_course_form
    render({ :template => "courses/new_course.html.erb"})
  end

  def add_course
    user_id = session.fetch(:user_id)

    course_name = params.fetch("input_course_name")
    course_code = params.fetch("input_course_code")
    course_requirement = params.fetch("input_course_requirement")
    course_grade = params.fetch("input_course_grade")
  
    course = Course.new
    course.owner_id = user_id
    course.course_name = course_name
    course.course_code = course_code
    course.requirement = course_requirement
    course.grade = course_grade
    course.save
    redirect_to("/courses/#{course.id}")
  end

  def course_show
    course_id = params.fetch("the_course")
    @course = Course.where({ :id => course_id }).first

    render({ :template => "courses/show.html.erb" })
  end

  #def edit_course_form

   # render({ :template => "courses/edit_form.html.erb"})
 # end

  

 def update_course_dos
    c_id = params.fetch("the_course_id")
    course = Course.where({ :id => c_id }).at(0)
    course.course_name = params.fetch("input_course_name")
    course.course_code = params.fetch("input_course_code")
    course.requirement = params.fetch("input_course_requirement")
    course.grade = params.fetch("input_course_grade")
    course.save

    redirect_to("/courses/#{course.id}")
 end


 def destroy_course_dos
    c_id = params.fetch("the_course_id")
    course = Course.where({ :id => c_id }).at(0)
    course.destroy

    redirect_to("/users", { :notice => "Course has been deleted!" })
    
 end

end
