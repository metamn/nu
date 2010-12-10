module ApplicationHelper

  # Get the application name
  def application_name
    Rails.application.class.to_s.split("::").first
  end
end
