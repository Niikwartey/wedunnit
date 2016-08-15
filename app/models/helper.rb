class Helper
  def self.current_user(session)
    if session[:id]
      User.find( session[:id] )
    else
      nil
    end
  end

  def self.current_user_name
    if session[:id]
      user = User.find( session[:id] )
      user.username
    else
      "log in to view your todo list."
    end
  end
  
  def self.has_account?(username)
    !!User.find_by( username: username )
  end
end