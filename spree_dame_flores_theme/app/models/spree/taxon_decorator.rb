Spree::Taxon.class_eval do
	scope :occasion_types, -> () { 
		occasion_tax = Spree::Taxon.where('name = "Ocasión"').first
		occasion_types = Spree::Taxon.where('parent_id = ?', occasion_tax.id)
		occasion_types
	}
	scope :product_types, -> () { 
		product_tax = Spree::Taxon.where('name = "Productos"').first
		product_types = Spree::Taxon.where('parent_id = ?', product_tax.id)
		product_types
	}
	scope :flower_types, -> () { 
		flower_tax = Spree::Taxon.where('name = "Flores"').first
		flower_types = Spree::Taxon.where('parent_id = ?', flower_tax.id)
		flower_types
	}
end