require 'java'

module US
  import com.google.appengine.api.users.UserServiceFactory
  Service = UserServiceFactory.user_service
end

def current_user
  if US::Service.user_logged_in?
    return US::Service.current_user
  else
    return false
  end      
end  

def logged_in?
  US::Service.user_logged_in?
end

def is_admin?
  US::Service.user_admin?
end

def login_url url=request.path_info
  US::Service.create_login_url(url)
end

def logout_url url=request.path_info
  US::Service.create_logout_url(url)
end

def require_user
  redirect US::Service.create_login_url(request.path_info) unless logged_in?
end

def require_admin  
  redirect US::Service.create_login_url(request.path_info) unless logged_in? && is_admin?
end