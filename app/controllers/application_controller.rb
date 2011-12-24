class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :detect_browser

  private
  MOBILE_BROWSERS = ["android","ipod","iphone","opera mini","blackberry","palm","hiptop","avantgo","plucker","xiino","blazer","elaine","windows ce; ppc;","windows ce; smartphone;","windows ce; iemobile","up.browser","up.link","mmp","symbian","smartphone","midp","wap","vodafone","o2","pocket","kindle","mobile","pda","psp","treo"]

  def detect_browser
    @search = Collection.search(params[:search])

    agent = request.headers["HTTP_USER_AGENT"].downcase
    MOBILE_BROWSERS.each do |m|
      return "mobile_application" if agent.match(m)
    end
    return "application"
  end

end
