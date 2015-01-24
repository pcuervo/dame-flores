Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  post "/search" => "home#search"
end
