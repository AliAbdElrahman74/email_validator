class ApplicationController < ActionController::API



  def render_message(m)
    {message: m}
  end
end
