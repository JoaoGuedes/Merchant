class AdministrationsController < ApplicationController
  http_basic_authenticate_with :name => "admin@merchant.com", :password => "merchant"
end
