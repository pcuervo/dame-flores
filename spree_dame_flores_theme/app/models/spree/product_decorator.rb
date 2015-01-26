Spree::Product.class_eval do
	scope :flowers, -> (flower_tax_id) { 
		return unless flower_tax_id != ''
		flowers = Spree::Taxon.find(flower_tax_id) 
		flowers.products
	}
	scope :occasions, -> (occasion_tax_id) { 
		return unless occasion_tax_id != ''
		occasions = Spree::Taxon.find(occasion_tax_id)
		occasions.products
	}
	scope :advanced_search, -> (params) { 
		logger.debug 'estamos aqui'
		
		filtered_product_ids = []
		params.each do |taxon, value|
			next if value[:id] == ''

			product_ids = []
			product_taxon = Spree::ProductTaxon.where('taxon_id = ?', value[:id])

			product_taxon.each do |pt|
				product_ids.push(pt.product_id)
			end

			if filtered_product_ids.empty?
				filtered_product_ids = filtered_product_ids.concat(product_ids)
				next
			end
			filtered_product_ids = filtered_product_ids & product_ids
		end

		products = Spree::Product.where('id IN (?)', filtered_product_ids)		
		products
	}

	
end