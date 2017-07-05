class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include SetTitle
  
  before_action :set_copyright
  
  def set_copyright
    @copyright = DevcampViewTool:: Renderer.copyright 'Kyle Christensen', 'All rights reserved'
  end
end


module DevcampViewTool
   class Renderer
     def self.copyright name, msg
       "&copy; #{Time.now.year} | <b>#{name}</b>"
     end
   end
end