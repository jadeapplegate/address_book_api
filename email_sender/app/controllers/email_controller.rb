class EmailController < ApplicationController

  def about
  end

  def email
  email = params[:email]
  SiteMailer.status_email(email[:email], email[:subject], email[:body]).deliver
  render nothing: true, status: 200
  #   # respond_to do |format|
  #     if @email.save
  #       format.html { redirect_to @email, notice: 'Email was successfully sent.' }
  #       format.json { render json: @email, status: :created }
  #     else
  #       format.html { render action: 'email' }
  #       format.json { render json: @email.errors, status: :unprocessable_entity }
  #     end
  # end
end

  def email_params
      params.require(:email).permit(:subject, :body)
  end
end