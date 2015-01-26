Spree::HomeController.class_eval do

  def index
    @products = Spree::Product.all

    @occasion_types = Spree::Taxon.occasion_types
    @product_types = Spree::Taxon.product_types
    @flower_types = Spree::Taxon.flower_types
  end

  def search
    @occasion_types = Spree::Taxon.occasion_types
    @product_types = Spree::Taxon.product_types
    @flower_types = Spree::Taxon.flower_types

    @products = Spree::Product.advanced_search(filtering_params(params))
    render :index
  end

  private

  def filtering_params(params)
    params.slice(:occasion, :product, :flower)
  end

end
