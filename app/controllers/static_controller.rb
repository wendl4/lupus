class StaticController < ApplicationController
  def login
  end

  def mydataset
  end

  def top10
  	@users = User.order("reliability").first(10).reverse
  end
end
