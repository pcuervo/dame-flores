# Enable the asset pipeline for fonts
config.assets.enabled = true

# Add the fonts path
config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

# Precompile additional assets
config.assets.precompile += %w( .svg .eot .woff .ttf )