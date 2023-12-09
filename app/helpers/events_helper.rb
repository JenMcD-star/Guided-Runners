module EventsHelper
  def log_in(user)
    events[:user_id] = user.id
  end
end