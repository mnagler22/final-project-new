Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "index" })

  get("/user_sign_up", {:controller => "application", :action => "sign_up"})

  get("/user_sign_out", {:controller => "application", :action => "sign_out"})

  get("/user_sign_in", {:controller => "application", :action => "sign_in"})

  post("/verify_guy", {:controller => "application", :action => "authenticate"} )

  get("/insert_user_record", {:controller => "application", :action => "create" })

  get("/users", {:controller => "application", :action => "index"})

  get("/users/:the_username", {:controller => "application", :action => "show"})

  get("/my_page", {:controller => "application", :action => "my_page"})

  get("/login_confirmation", {:controller => "application", :action => "login_confirmation"})

  get("/update_user/:the_user_id", {:controller => "application", :action => "update" })

  get("/delete_user/:the_user_id", {:controller => "application", :action => "destroy"})

  #course routes

  get("/courses", {:controller => "application", :action => "course_index"})

  get("/courses/:the_course", {:controller => "application", :action => "course_show"})

  get("/insert_course_record", {:controller => "application", :action => "add_course"})

  get("/new_course", {:controller => "application", :action => "new_course_form"})

  #get("/edit_course", {:controller => "application", :action => "edit_course_form"})

  get("/update_course/:the_course_id", {:controller => "application", :action => "update_course" })

  get("/delete_course/:the_course_id", {:controller => "application", :action => "destroy_course"})



  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
