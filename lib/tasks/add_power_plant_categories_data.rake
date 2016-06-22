require 'rake'
namespace :categories do
	task :add_power_plant_categories_data => :environment do
		pp_category = Category.create(name: "Complete power plant", status: "active")
		pp_sub_categories = ["Coal Fired Power Plants", "Cogeneration Power Plants", "Diesel Fired Power Plants", "Heavy Fuel Oil Fired Power Plants", "Natural Gas Fired Power Plants", "Waste and Biomass Fired Power Plants", "Nuclear power plants", "Power barge", "Solar power plants", "Wind power plants"]
		pp_sub_categories.each do |sub_cat|
			Category.create(name: sub_cat, parent_id: pp_category.id, status: "active")
		end
	end
end