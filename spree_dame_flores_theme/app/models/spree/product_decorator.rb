Spree::Product.class_eval do
	# Advanced search based on taxonomies and price range.
	# Params:
	# - filters: An array containing one or more of the following (flower type, ocassion, product type, start and)
	# 
	scope :advanced_search, -> (filters) { 
		filtered_product_ids = []
		start_price = 0
		end_price = 100000
		filters.each do |key, value|
			if key == 'start_price'
				start_price = value
				next
			end

			if key == 'end_price'
				end_price = value
				next
			end

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

		logger.debug start_price.to_s
		logger.debug end_price.to_s

		products = Spree::Product.price_between(start_price, end_price)	
		if ! filtered_product_ids.empty?
			products = products.where('spree_products.id IN (?)', filtered_product_ids)
		end
		products
	}

end