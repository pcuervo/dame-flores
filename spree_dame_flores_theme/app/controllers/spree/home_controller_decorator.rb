Spree::HomeController.class_eval do

  def index
    @products = Spree::Product.all
    @flower_types = Spree::Taxon.where('parent_id = 11')
  end

  def search
    render :index
  end

end
