class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @event  = current_user.events.build
      @pagy, @feed_items = pagy(current_user.feed, items:5)

    
    end
  end


  def help
  end


  def about
  end

 
  def contact
  end
end
