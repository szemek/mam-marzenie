# Paths helper
module NavigationHelpers
  def path_to(page_name)
    case page_name
    when /the homepage/ then root_path
    when /register/ then new_user_registration_path
    when /login/ then new_user_session_path
    when /logout/ then destroy_user_session_path
    when /profile/ then edit_user_registration_path
    else fail %Q{Can't find mapping from "#{page_name}" to a path.}
    end
  end
end

World(NavigationHelpers)
