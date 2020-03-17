Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "index" })

  get("/user_sign_up", {:controller => "application", :action => "sign_up"})

  get("/user_sign_out", {:controller => "application", :action => "sign_out"})

  get("/user_sign_in", {:controller => "application", :action => "sign_in"})

  post("/verify_guy", {:controller => "application", :action => "authenticate"} )

  get("/insert_user_record", {:controller => "application", :action => "create" })

  get("/users", {:controller => "application", :action => "index"})

  get("/users/:the_username", {:controller => "application", :action => "show"})

  get("/update_user/:the_user_id", {:controller => "application", :action => "update" })

  get("/delete_user/:the_user_id", {:controller => "application", :action => "destroy"})


  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
