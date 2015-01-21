Deface::Override.new(:virtual_path  => "spree/layouts/spree_application",
	:remove => "erb[loud]:contains('wrapper')",
	:name 	=> "registration_future")