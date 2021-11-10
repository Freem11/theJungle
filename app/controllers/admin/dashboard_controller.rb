class Admin::DashboardController < Admin::BaseController

  def show

    @categories = Category.count(:all)
    @products = Product.count(:all)
  end
    
end

