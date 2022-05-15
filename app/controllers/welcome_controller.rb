class WelcomeController < ApplicationController
  def index
    @discs = Disc.all
  end
end
