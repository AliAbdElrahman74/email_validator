class UsersController < ApplicationController


  def validate_email
    response = Validators::Email.new(params[:email]).validate

    if response["success"] == false
      render json: render_message(response["error"]["info"]), status: 422
      return
    end

    if response["smtp_check"] && !response["disposable"]
      render json: render_message("You can use this email"), status: 200
    else
      render json: failure_message("This domain does not exist as an SMTP domain"), status: 404
    end
  end


end
