# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( seller/seller.css seller/seller.js seller/equipment.js seller/messages.js signature-pad.css signature_pad.js signature_app.js jquery.mCustomScrollbar.concat.min.js circle.css jquery.mCustomScrollbar.css bootstrap-filestyle.min.js bootstrap-select.min.css bootstrap-select.min.js)
