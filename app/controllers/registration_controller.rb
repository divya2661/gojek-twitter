class RegistrationController < ApplicationController
  layout "registration"

  def index
    @registration_props = {name:"", email: "", password: "", confirmPassword: ""}
  end

end
