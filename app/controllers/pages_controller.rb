class PagesController < ApplicationController
  def home
    @boats = Boat.all
  end

  def about
  end
end
