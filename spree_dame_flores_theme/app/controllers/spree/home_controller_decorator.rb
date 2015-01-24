Spree::HomeController.class_eval do

  def index
    @products = Spree::Product.all
    @flower_types = Spree::Taxon.where('parent_id = 11')
  end

  def search
    if params[:flower][:id]
      flowers = Spree::Taxon.where('name = "Flores"')
    end

    @flower_types = Spree::Taxon.where('parent_id = 11')
    render :index
  end

end
