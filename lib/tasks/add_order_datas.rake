require 'rake'
namespace :orders do
	task :add_order_datas => :environment do
		order1 = Equipment.first.orders.create!(price: 200, name: 'test1', email: 'test1@example.com', mobile: '1234567890', country_id: 1, company_website: 'example.com', company_name: 'example', commission: 10,status: 'Seller Confirmed')
		order2 = Equipment.second.orders.create!(price: 400, name: 'test2', email: 'test2@example.com', mobile: '1234567890', country_id: 5, company_website: 'example.com', company_name: 'example', commission: 12.36,status: 'Seller Confirmed')
		order3 = Equipment.first(3).last.orders.create!(price: 800, name: 'test3', email: 'test3@example.com', mobile: '1234567890', country_id:7, company_website: 'example.com', company_name: 'example', commission: 41.2,status: 'Seller Confirmed')
		order4 = Equipment.first(4).last.orders.create!(price: 1200, name: 'test4', email: 'test4@example.com', mobile: '1234567890', country_id: 3, company_website: 'example.com', company_name: 'example', commission: 15,status: 'Seller Confirmed')
		order5 = Equipment.first(5).last.orders.create!(price: 700, name: 'test5', email: 'test5@example.com', mobile: '1234567890', country_id: 9, company_website: 'example.com', company_name: 'example', commission: 12.36,status: 'Seller Confirmed')
	end
end

