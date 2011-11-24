class AdministrationsController < ApplicationController
  http_basic_authenticate_with :name => "admin", :password => "merchant"
end
