class PagesController < ApplicationController
  def home
    @projects = Project.all
  end

  def about
  end

  def directions
  end
end
