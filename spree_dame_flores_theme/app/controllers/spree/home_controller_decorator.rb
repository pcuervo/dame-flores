Spree::HomeController.class_eval do

  def index
    @products = Spree::Product.all
  end

end
