# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#### Masters Data ##########
puts "================== Started loading masters table data ========================\n"
manufacturers = ['Siemens','Bhushan','T&R','Electrabel','Ontario power']
manufacturers.each do |manufacture_name|
	manufacture = Manufacturer.where(name: manufacture_name).first_or_initialize
	manufacture.save(validate: false)
	print "."
end
Manufacturer.update_all(status: 1) # Updating status as active for all records

currencies = {'AED' => '&#1583;.&#1573;','AFN' => '&#65;&#102;','ALL' => '&#76;&#101;&#107;','ANG' => '&#402;','AOA' => '&#75;&#122;','ARS' => '&#36;','AUD' => '&#36;','AWG' => '&#402;','AZN' => '&#1084;&#1072;&#1085;','BAM' => '&#75;&#77;','BBD' => '&#36;','BDT' => '&#2547;','BGN' => '&#1083;&#1074;','BHD' => '.&#1583;.&#1576;','BIF' => '&#70;&#66;&#117;','BMD' => '&#36;','BND' => '&#36;','BOB' => '&#36;&#98;','BRL' => '&#82;&#36;','BSD' => '&#36;','BTN' => '&#78;&#117;&#46;','BWP' => '&#80;','BYR' => '&#112;&#46;','BZD' => '&#66;&#90;&#36;','CAD' => '&#36;','CDF' => '&#70;&#67;','CHF' => '&#67;&#72;&#70;','CLP' => '&#36;','CNY' => '&#165;','COP' => '&#36;','CRC' => '&#8353;','CUP' => '&#8396;','CVE' => '&#36;','CZK' => '&#75;&#269;','DJF' => '&#70;&#100;&#106;','DKK' => '&#107;&#114;','DOP' => '&#82;&#68;&#36;','DZD' => '&#1583;&#1580;','EGP' => '&#163;','ETB' => '&#66;&#114;','EUR' => '&#8364;','FJD' => '&#36;','FKP' => '&#163;','GBP' => '&#163;','GEL' => '&#4314;','GHS' => '&#162;','GIP' => '&#163;','GMD' => '&#68;','GNF' => '&#70;&#71;','GTQ' => '&#81;','GYD' => '&#36;','HKD' => '&#36;','HNL' => '&#76;','HRK' => '&#107;&#110;','HTG' => '&#71;','HUF' => '&#70;&#116;','IDR' => '&#82;&#112;','ILS' => '&#8362;','INR' => '&#8377;','IQD' => '&#1593;.&#1583;','IRR' => '&#65020;','ISK' => '&#107;&#114;','JEP' => '&#163;','JMD' => '&#74;&#36;','JOD' => '&#74;&#68;','JPY' => '&#165;','KES' => '&#75;&#83;&#104;','KGS' => '&#1083;&#1074;','KHR' => '&#6107;','KMF' => '&#67;&#70;','KPW' => '&#8361;','KRW' => '&#8361;','KWD' => '&#1583;.&#1603;','KYD' => '&#36;','KZT' => '&#1083;&#1074;','LAK' => '&#8365;','LBP' => '&#163;','LKR' => '&#8360;','LRD' => '&#36;','LSL' => '&#76;','LTL' => '&#76;&#116;','LVL' => '&#76;&#115;','LYD' => '&#1604;.&#1583;','MAD' => '&#1583;.&#1605;.','MDL' => '&#76;','MGA' => '&#65;&#114;','MKD' => '&#1076;&#1077;&#1085;','MMK' => '&#75;','MNT' => '&#8366;','MOP' => '&#77;&#79;&#80;&#36;','MRO' => '&#85;&#77;','MUR' => '&#8360;','MVR' => '.&#1923;','MWK' => '&#77;&#75;','MXN' => '&#36;','MYR' => '&#82;&#77;','MZN' => '&#77;&#84;','NAD' => '&#36;','NGN' => '&#8358;','NIO' => '&#67;&#36;','NOK' => '&#107;&#114;','NPR' => '&#8360;','NZD' => '&#36;','OMR' => '&#65020;','PAB' => '&#66;&#47;&#46;','PEN' => '&#83;&#47;&#46;','PGK' => '&#75;','PHP' => '&#8369;','PKR' => '&#8360;','PLN' => '&#122;&#322;','PYG' => '&#71;&#115;','QAR' => '&#65020;','RON' => '&#108;&#101;&#105;','RSD' => '&#1044;&#1080;&#1085;&#46;','RUB' => '&#1088;&#1091;&#1073;','RWF' => '&#1585;.&#1587;','SAR' => '&#65020;','SBD' => '&#36;','SCR' => '&#8360;','SDG' => '&#163;','SEK' => '&#107;&#114;','SGD' => '&#36;','SHP' => '&#163;','SLL' => '&#76;&#101;','SOS' => '&#83;','SRD' => '&#36;','STD' => '&#68;&#98;','SVC' => '&#36;','SYP' => '&#163;','SZL' => '&#76;','THB' => '&#3647;','TJS' => '&#84;&#74;&#83;','TMT' => '&#109;','TND' => '&#1583;.&#1578;','TOP' => '&#84;&#36;','TRY' => '&#8356;','TTD' => '&#36;','TWD' => '&#78;&#84;&#36;','UAH' => '&#8372;','UGX' => '&#85;&#83;&#104;','USD' => '&#36;','UYU' => '&#36;&#85;','UZS' => '&#1083;&#1074;','VEF' => '&#66;&#115;','VND' => '&#8363;','VUV' => '&#86;&#84;','WST' => '&#87;&#83;&#36;','XAF' => '&#70;&#67;&#70;&#65;','XCD' => '&#36;','XPF' => '&#70;','YER' => '&#65020;','ZAR' => '&#82;','ZMK' => '&#90;&#75;','ZWL' => '&#90;&#36;'}

currencies.each do |currency_name, currency_symbol|
	currency = Currency.where(name: currency_name).first_or_initialize
	currency.symbol = currency_symbol
	currency.save(validate: false)
	print "."
end
Currency.update_all(status: 1) # Updating status as active for all records

countries = {"Afghanistan"=>"AF","Åland Islands"=>"AX","Albania"=>"AL","Algeria"=>"DZ","American Samoa"=>"AS","Andorra"=>"AD","Angola"=>"AO","Anguilla"=>"AI","Antarctica"=>"AQ","Antigua and Barbuda"=>"AG","Argentina"=>"AR","Armenia"=>"AM","Aruba"=>"AW","Australia"=>"AU","Austria"=>"AT","Azerbaijan"=>"AZ","Bahamas"=>"BS","Bahrain"=>"BH","Bangladesh"=>"BD","Barbados"=>"BB","Belarus"=>"BY","Belgium"=>"BE","Belize"=>"BZ","Benin"=>"BJ","Bermuda"=>"BM","Bhutan"=>"BT","Bolivia, Plurinational State of"=>"BO","Bonaire, Sint Eustatius and Saba"=>"BQ","Bosnia and Herzegovina"=>"BA","Botswana"=>"BW","Bouvet Island"=>"BV","Brazil"=>"BR","British Indian Ocean Territory"=>"IO","Brunei Darussalam"=>"BN","Bulgaria"=>"BG","Burkina Faso"=>"BF","Burundi"=>"BI","Cambodia"=>"KH","Cameroon"=>"CM","Canada"=>"CA","Cape Verde"=>"CV","Cayman Islands"=>"KY","Central African Republic"=>"CF","Chad"=>"TD","Chile"=>"CL","China"=>"CN","Christmas Island"=>"CX","Cocos (Keeling) Islands"=>"CC","Colombia"=>"CO","Comoros"=>"KM","Congo"=>"CG","Congo, the Democratic Republic of the"=>"CD","Cook Islands"=>"CK","Costa Rica"=>"CR","Côte d'Ivoire"=>"CI","Croatia"=>"HR","Cuba"=>"CU","Curaçao"=>"CW","Cyprus"=>"CY","Czech Republic"=>"CZ","Denmark"=>"DK","Djibouti"=>"DJ","Dominica"=>"DM","Dominican Republic"=>"DO","Ecuador"=>"EC","Egypt"=>"EG","El Salvador"=>"SV","Equatorial Guinea"=>"GQ","Eritrea"=>"ER","Estonia"=>"EE","Ethiopia"=>"ET","Falkland Islands (Malvinas)"=>"FK","Faroe Islands"=>"FO","Fiji"=>"FJ","Finland"=>"FI","France"=>"FR","French Guiana"=>"GF","French Polynesia"=>"PF","French Southern Territories"=>"TF","Gabon"=>"GA","Gambia"=>"GM","Georgia"=>"GE","Germany"=>"DE","Ghana"=>"GH","Gibraltar"=>"GI","Greece"=>"GR","Greenland"=>"GL","Grenada"=>"GD","Guadeloupe"=>"GP","Guam"=>"GU","Guatemala"=>"GT","Guernsey"=>"GG","Guinea"=>"GN","Guinea-Bissau"=>"GW","Guyana"=>"GY","Haiti"=>"HT","Heard Island and McDonald Islands"=>"HM","Holy See (Vatican City State)"=>"VA","Honduras"=>"HN","Hong Kong"=>"HK","Hungary"=>"HU","Iceland"=>"IS","India"=>"IN","Indonesia"=>"ID","Iran, Islamic Republic of"=>"IR","Iraq"=>"IQ","Ireland"=>"IE","Isle of Man"=>"IM","Israel"=>"IL","Italy"=>"IT","Jamaica"=>"JM","Japan"=>"JP","Jersey"=>"JE","Jordan"=>"JO","Kazakhstan"=>"KZ","Kenya"=>"KE","Kiribati"=>"KI","Korea, Democratic People's Republic of"=>"KP","Korea, Republic of"=>"KR","Kuwait"=>"KW","Kyrgyzstan"=>"KG","Lao People's Democratic Republic"=>"LA","Latvia"=>"LV","Lebanon"=>"LB","Lesotho"=>"LS","Liberia"=>"LR","Libya"=>"LY","Liechtenstein"=>"LI","Lithuania"=>"LT","Luxembourg"=>"LU","Macao"=>"MO","Macedonia, the Former Yugoslav Republic of"=>"MK","Madagascar"=>"MG","Malawi"=>"MW","Malaysia"=>"MY","Maldives"=>"MV","Mali"=>"ML","Malta"=>"MT","Marshall Islands"=>"MH","Martinique"=>"MQ","Mauritania"=>"MR","Mauritius"=>"MU","Mayotte"=>"YT","Mexico"=>"MX","Micronesia, Federated States of"=>"FM","Moldova, Republic of"=>"MD","Monaco"=>"MC","Mongolia"=>"MN","Montenegro"=>"ME","Montserrat"=>"MS","Morocco"=>"MA","Mozambique"=>"MZ","Myanmar"=>"MM","Namibia"=>"NA","Nauru"=>"NR","Nepal"=>"NP","Netherlands"=>"NL","New Caledonia"=>"NC","New Zealand"=>"NZ","Nicaragua"=>"NI","Niger"=>"NE","Nigeria"=>"NG","Niue"=>"NU","Norfolk Island"=>"NF","Northern Mariana Islands"=>"MP","Norway"=>"NO","Oman"=>"OM","Pakistan"=>"PK","Palau"=>"PW","Palestine, State of"=>"PS","Panama"=>"PA","Papua New Guinea"=>"PG","Paraguay"=>"PY","Peru"=>"PE","Philippines"=>"PH","Pitcairn"=>"PN","Poland"=>"PL","Portugal"=>"PT","Puerto Rico"=>"PR","Qatar"=>"QA","Réunion"=>"RE","Romania"=>"RO","Russian Federation"=>"RU","Rwanda"=>"RW","Saint Barthélemy"=>"BL","Saint Helena, Ascension and Tristan da Cunha"=>"SH","Saint Kitts and Nevis"=>"KN","Saint Lucia"=>"LC","Saint Martin (French part)"=>"MF","Saint Pierre and Miquelon"=>"PM","Saint Vincent and the Grenadines"=>"VC","Samoa"=>"WS","San Marino"=>"SM","Sao Tome and Principe"=>"ST","Saudi Arabia"=>"SA","Senegal"=>"SN","Serbia"=>"RS","Seychelles"=>"SC","Sierra Leone"=>"SL","Singapore"=>"SG","Sint Maarten (Dutch part)"=>"SX","Slovakia"=>"SK","Slovenia"=>"SI","Solomon Islands"=>"SB","Somalia"=>"SO","South Africa"=>"ZA","South Georgia and the South Sandwich Islands"=>"GS","South Sudan"=>"SS","Spain"=>"ES","Sri Lanka"=>"LK","Sudan"=>"SD","Suriname"=>"SR","Svalbard and Jan Mayen"=>"SJ","Swaziland"=>"SZ","Sweden"=>"SE","Switzerland"=>"CH","Syrian Arab Republic"=>"SY","Taiwan, Province of China"=>"TW","Tajikistan"=>"TJ","Tanzania, United Republic of"=>"TZ","Thailand"=>"TH","Timor-Leste"=>"TL","Togo"=>"TG","Tokelau"=>"TK","Tonga"=>"TO","Trinidad and Tobago"=>"TT","Tunisia"=>"TN","Turkey"=>"TR","Turkmenistan"=>"TM","Turks and Caicos Islands"=>"TC","Tuvalu"=>"TV","Uganda"=>"UG","Ukraine"=>"UA","United Arab Emirates"=>"AE","United Kingdom"=>"GB","United States"=>"US","United States Minor Outlying Islands"=>"UM","Uruguay"=>"UY","Uzbekistan"=>"UZ","Vanuatu"=>"VU","Venezuela, Bolivarian Republic of"=>"VE","Viet Nam"=>"VN","Virgin Islands, British"=>"VG","Virgin Islands, U.S."=>"VI","Wallis and Futuna"=>"WF","Western Sahara"=>"EH","Yemen"=>"YE","Zambia"=>"ZM","Zimbabwe"=>"ZW"}

countries.each do |country_name, country_code|
	country = Country.where(code: country_code).first_or_initialize
	country.name = country_name
	country.save(validate: false)
	print "."
end
Country.update_all(status: 1) # Updating status as active for all records

categories = {"Used Broadcast, Film and Audio Equipment"=>["Video Tester", "Other Broadcast Equipment, Film & Audio", "Cameras & Lenses", "Audio Equipment", "Editing Equipment", "VTR", "Pro Lighting Equipment", "Monitors & Projectors", "Telecine Equipment", "Video Conferencing Equipment", "Broadcast Software", "Satellite Equipment"], "Used PCB Assembly and Semiconductor Equipment"=>["PCB Assembly Equipment", "Automatic Test Equipment - ATE", "Semiconductor Equipment", "PCB Inspection"], "Used Process, Packaging and Manufacturing"=>["Other Process & Packaging Machinery", "Water Treatment System", "Electrical Equipment", "Optical Media Manufacturing", "Tanks & Silos", "Inspection Equipment", "Industrial Robot", "Recycling Machinery", "Pumps, Valves & Compressors", "Food & Beverage Equipment", "Chemical Processing", "Steel Making Equipment", "Heat Exchanger", "Pharmaceutical Equipment", "Paper Manufacturing Equipment", "Boiler"], "Used Lab, Medical and Bioscience Equipment"=>["Clinical Lab Equipment", "Bioscience Equipment", "Dental Equipment", "Veterinary Equipment", "Hospital Equipment", "Microscope", "Analytical Lab", "Medical Equipment Parts", "Medical Equipment", "General Lab"], "Used Construction and Mining Equipment"=>["Construction Machinery", "Form Work", "Crane", "Mining Machines & Aggregates", "Farm Machinery", "Semi Truck & Trailer", "Material Handling Equipment", "Oilfield Equipment", "Forestry Equipment"], "Used Metalworking Machinery"=>["Metalworking Lines", "Machining Centre", "Drilling Machine", "Metal Finishing", "EDM Equipment", "Metal Saw", "Welding Equipment", "Broaching Machine", "Other Machine Tools", "Lathe", "Metal Fabrication", "Grinding Machine", "Boring Mill", "Milling Machine", "Steel Processing Equipment", "Gear Manufacturing", "Metal Testing Equipment", "Stamping Press"], "Used Woodworking Machinery"=>["Wood Router", "Presses", "Saws", "Clamping", "Laminating Equipment", "Planer", "Sander", "Other Equipment", "Boring Machine", "Finishing Equipment", "Moulder", "Edgebander"], "Used Test and Measurement Equipment"=>["Other Test & Measurement", "Optical Test Equipment", "Telecom", "Waveguide Equipment", "Software", "System Power Supply", "Generator", "Test Amplifier", "Analyzer", "Probe", "Oscilloscope", "Meter", "RF Equipment & Microwave"], "Used Plastics Equipment"=>["Blow Moulding", "Other Molding Machines", "Thermoforming", "Plastics Production Lines", "Printing & Finishing", "Mixers & Blenders", "Plastic Bag Making Machine", "Other Plastic Machinery", "Plastic Recycling Equipment", "Extruder", "Injection Molding Machine"], "Used Networking and Telecoms Equipment"=>["Telecoms Equipment", "Computer Peripherals", "Networking Equipment", "Printer", "Barcode Equipment", "Desktops", "Storage", "Laptops", "Server"], "Used Printing Machinery"=>["Prepress", "Sheetfed Press", "Bindery & Finishing", "Mailing Equipment", "Paper Handling", "Scanners", "Photocopier", "Photo Lab", "Digital Press", "Web Fed Press", "Flatbed Screen Printer", "Large Format Printer"], "Complete Plants"=>["Other Redundant Plants & Lines", "Power Plant", "Acid Plant", "Chemical Plant", "Oil Refinery", "Cement Plant", "Industrial Gas Plant", "Plastics Manufacturing Plant", "Polymer Plant", "Electronics Manufacturing Plant", "Steel Mill", "Food & Beverage Plant"]}
child_categories = {"Cameras & Lenses"=>["Camera Lens", "HD Camcorder", "DV Camcorder", "Steadicam", "Beta Camcorder", "16mm Camera", "Camera Parts", "35mm Movie Camera", "Pro Tripod", "Lens Filter", "Camera Battery", "Camcorder Case", "Movie Camera - Other", "Professional Video Camera"], "Used Audio Equipment"=>["General Studio Equipment", "Microphone", "Other Audio Equipment", "Mixing Console", "Audio Recorders", "Headphones", "Studio Monitor", "Studio Amp", "Studio Effects"], "PCB Assembly Equipment"=>["Pick and Place Machine", "Complete PCB Assembly Line", "Wire Processing Equipment", "Feeders & Accessories", "PCB Assembly Spares & Parts", "Board Cleaning Equipment", "PCB Router", "PCB Robot", "Screen Printer", "Rework Station", "Feeder Trolley", "Glue Dispenser", "PCB Conveyor", "Other SMT Equipment", "Auto Insertion Machine", "Soldering Machine", "Reflow Oven & Other Ovens"], "Automatic Test Equipment - ATE"=>["Other ATE", "Flying Prober", "PCB Circuit Tester", "Component Tester"], "Water Treatment System"=>["Filtration Equipment", "Other Water Processing Equipment", "Reverse Osmosis System", "Wastewater Treatment System"], "Inspection Equipment"=>["Optical Measurement Equipment", "Process Measurement Equipment"], "Clinical Lab Equipment"=>["Urinalysis Analyzer", "Electrolyte Analyzer", "Pathology Equipment", "Immunology Analyzer", "Blood Analyzer", "Other Clinical Testing Equipment", "Coagulation Analyzer", "Histology Equipment", "Medical Centrifuge", "Clinical Chemistry Analyzer", "Blood Gas Analyzer"], "Bioscience Equipment"=>["Electrophoresis Equipment", "Thermal Cycler", "Immunoassay System", "Biotech Equipment", "Array Scanner", "Vacuum Blotter", "DNA Analyzer", "Microplate Reader"], "Mining Machines & Aggregates"=>["PDC Drill Bit", "TCI Drill Bit", "Other Drill Bit", "Screening Machine", "Other Aggregates Equipment", "Pump for Mining", "Aggregate Feeder", "Other Mining Equipment", "Radial Stacker", "Asphalt Plant", "Mining Silo", "Jaw Crusher", "Other Crusher", "Impact Crusher", "Tooth Drill Bit", "Mining Equipment Parts", "Aggregate Conveyor", "Belt Conveyor"]}

categories.each do |name, sub_categories|
	category = Category.active.where(name: name).first_or_initialize
	category.save(validate: false)
	print "."
	sub_categories.each do |name|
		sub_category = Category.active.where(name: name).first_or_initialize
		sub_category.save(validate: false)
		sub_category.move_to_child_of(category)
		print "."
		sub_sub_categories = child_categories[name]
		if sub_sub_categories.present?
			sub_sub_categories.each do |name|
				child_category = Category.active.where(name: name).first_or_initialize
				child_category.save(validate: false)
				child_category.move_to_child_of(sub_category)
				print "."
			end
		end
	end
end
Category.update_all(status: 1) # Updating status as active for all records
puts "\n============ Finished loading masters table data =========================="

puts "######################## Creating Super Admin ########################"

AdminUser.create!(email: 'super_admin@example.com', name: 'Super Admin', password: 'admin123', password_confirmation: 'admin123', role: 'super_admin', active: true)

puts "######################## Creating User ########################"
user1 = User.new(email: 'user1@example.com',email_confirmation: 'user1@example.com', password: 'user123', password_confirmation: 'user123', role: 'seller', user_type: "Equipment Owner", active: true)
user1.build_profile(first_name: 'test1', last_name: 'user1',company_name: 'example',phone_number: '1234567890', country_id: 1, website: "www.example1.com")
user1.save
user2 = User.new(email: 'user2@example.com',email_confirmation: 'user2@example.com', password: 'user123', password_confirmation: 'user123', role: 'seller', user_type: "Trader", active: true)
user2.build_profile(first_name: 'test2', last_name: 'user2',company_name: 'example',phone_number: '1234567890', country_id: 2, website: "www.example2.com")
user2.save

puts "######################## Creating Static Pages ########################"

static_page_data =
  [{title: 'User agreement', url: 'user_agreement', content: '<section id="md" class="lst-midd-cnt">
		  <div class="wht-bg MB30">
		    <div class="container">
		      <div class="row">
		        <div class="col-lg-12">
		         <div class="static-pg PT30 PB30">
		         <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
		         <p>It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
		         <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
		         <h3>Lorem Heading goes</h3>
		         <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
		         <ul>
		         <li>Lorem Ipsum is simply dummy text of the printing and typesetting industr</li>
		         <li>Contrary to popular belief, Lorem Ipsum is not simply</li>
		         <li>Lorem Ipsum is simply dummy text of the printing and typesetting industr</li>
		         <li>Contrary to popular belief, Lorem Ipsum is not simply</li>
		         </ul>
		         <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
		        </div>
		      </div>
		    </div>
		  </div>
		</section>'},
  {title: 'Terms & conditions', url: 'terms_and_conditions', content: '<section id="md" class="lst-midd-cnt">
		  <div class="wht-bg MB30">
		    <div class="container">
		      <div class="row">
		        <div class="col-lg-12">
		         <div class="static-pg PT30 PB30">
		         <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
		         <p>It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
		         <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
		         <h3>Lorem Heading goes</h3>
		         <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
		         <ul>
		         <li>Lorem Ipsum is simply dummy text of the printing and typesetting industr</li>
		         <li>Contrary to popular belief, Lorem Ipsum is not simply</li>
		         <li>Lorem Ipsum is simply dummy text of the printing and typesetting industr</li>
		         <li>Contrary to popular belief, Lorem Ipsum is not simply</li>
		         </ul>
		         <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
		        </div>
		      </div>
		    </div>
		  </div>
		 </section>'},
  {title: 'Our Policy', url: 'our_policy', content: '<section id="md" class="lst-midd-cnt">
		  <div class="wht-bg MB30">
		    <div class="container">
		      <div class="row">
		        <div class="col-lg-12">
		         <div class="static-pg PT30 PB30">
		         <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
		         <p>It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
		         <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
		         <h3>Lorem Heading goes</h3>
		         <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
		         <ul>
		         <li>Lorem Ipsum is simply dummy text of the printing and typesetting industr</li>
		         <li>Contrary to popular belief, Lorem Ipsum is not simply</li>
		         <li>Lorem Ipsum is simply dummy text of the printing and typesetting industr</li>
		         <li>Contrary to popular belief, Lorem Ipsum is not simply</li>
		         </ul>
		         <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
		        </div>
		      </div>
		    </div>
		  </div>
		</section>'},
  {title: 'Welcome to power cozmo', url: 'welcome_to_power_cozmo', content: '<section id="md" class="lst-midd-cnt">
     	<div class="wht-bg PT40 jumptarget" id="_power_cozmo">
		    <div class="welcome-inr-cnt">
		      <h2 class="page-hd txtctr">What is <span>power Cozmo?</span></h2>
		    	<div class="welcome-inr-img">
		      	<div class="container">
		          <div class="row">
		      	    <div class="col-lg-12"><img src="/assets/welcome-big-img1.png"></div>
		          </div>
		        </div>
		      </div>
		      <div class="welcome-inr-txt">

		        <div class="container">
		          <div class="row">
		          	<div class="col-lg-12">
		              <div class="welcome-para"><p>Power Cozmo is online automated platform works as market place for all power plants need, based on connecting sellers & buyers together all over the world, You can :</p></div>
		              <ul class="whatpower-lst">
		              <li>Sell, Buy & trade safely of your used or surplus power equipment by our worldwide online automated platform, Just post your advertisement in minutes.</li>
		              <li>Post your buying request on our platform and you will get quotes from many sellers and suppliers.</li>
		              </ul>
		              <div class="clr"></div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		  <div class="wht-bg PT40 jumptarget" id="_us">
		    <div class="welcome-inr-cnt">
		      <h2 class="page-hd txtctr">WHO <span>WE ARE?</span></h2>
		    	<div class="welcome-inr-img">
		      	<div class="container">
		      	  <div class="row">
		            <div class="col-lg-12"><img src="/assets/welcome-big-img2.png"></div>
		          </div>
		        </div>
		      </div>
		      <div class="welcome-inr-txt">
		      	<div class="container">
		      	  <div class="row">
		            <div class="col-lg-12">
		              <div class="whowe-cnt-area">
		              	<p>Power Cozmo has selected a team of leaders who are passionate about the business and are committed to its success. Together, they foster a culture of excellence with employees at the heart of the       business.</p>
		                  <p>The management team creates an open and respectful culture which aims to empower the whole organization and recognize the value people bring to the company.</p>
		              </div>
		              <div class="whowe-cnt-area fr">
		              	<p>Power Cozmo represents a truly unique opportunity for us all. It         provides a fresh start; the opportunity to leverage the collective         knowledge and capabilities of both organizations, the ability to strengthen and deliver a truly world-class power services company - and most importantly, a service platform from which to create real value for our customers.</p>
		                  <p>We are excited about the prospects for Power Cozmo . We have expert team in power plant industry , world-class facilities, technology and two shareholders that are committed to the success of the business."</p>
		              </div>
		              <div class="clr"></div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		  <div class="blue-bg PT40 PB40" id="team">
		    <div class="container">
					<div class="row">
		      	<div class="col-lg-12">
		        	<div class="welcome-inr-cnt">
		          	<div class="meet-our-team">
		              <h2 class="page-hd txtctr">MEET <span>OUR TEAM</span></h2>
		              <h3>Coming together is a beginning. Keeping together is progress. Working together is success.</h3>
		              <p>Each and every one of our employees represent the spirit of our company: driven, committed, and acutely aware of how limitless Power Cozmo potential is to grow. We go to great lengths to identify self-starters with diverse experience and skill sets to produce not just an effective workforce, but a well-rounded, talented and complementary team.</p>
		            </div>
		          </div>
		        </div>
		        <div id="pr-category" class="owl-carousel">
		          <div class="item">
		            <div class="col-lg-12 col-md-12 cat-lst">
		              <div class="team-photo">
		              	<img src="/assets/team-img1.jpg">
		                <div class="team-info">
		                	<span>Kamal Al-Qaq</span>
		                    General Manager
		                </div>
		              </div>
		            </div>
		          </div>
		          <div class="item">
		          	<div class="col-lg-12 col-md-12 cat-lst">
		              <div class="team-photo">
		              	<img src="/assets/team-img2.jpg">
		                <div class="team-info">
		                	<span>Kamal Al-Qaq</span>
		                    General Manager
		                </div>
		              </div>
		            </div>
		          </div>
		          <div class="item">
		            <div class="col-lg-12 col-md-12 cat-lst">
		              <div class="team-photo">
		            	  <img src="/assets/team-img3.jpg">
		                <div class="team-info">
		              	  <span>Ibrahim ESameeh </span>
		                  Business development manager
		                </div>
		              </div>
		            </div>
		          </div>
		           <div class="item">
		           	<div class="col-lg-12 col-md-12 cat-lst">
		                <div class="team-photo">
		                	<img src="/assets/team-img4.jpg">
		                  <div class="team-info">
		                  	<span>Ravinder Nagar</span>
		                      IT Consultant
		                  </div>
		                </div>
		              </div>
		           </div>
		        </div>
		      </div>
		    </div>
		  </div></section>'},
	{title: 'How we work?', url: 'how_we_work', content: '<section id="md" class="lst-midd-cnt">
		  <div class="wht-bg PT50">
		    <div class="container">
		      <div class="row">
		        <div class="col-lg-12 hwitwk-cnt">
		          <div class="hwitwk-tab">
		            <ul id="myTab1">
		              <li class="active"><a href="#how-one" data-toggle="tab">Sell</a></li>
		              <li class=""><a href="#how-two" data-toggle="tab">Buy</a></li>
		              <li class=""><a href="#how-three" data-toggle="tab">Pay</a></li>
		              <li class=""><a href="#how-four" data-toggle="tab">Commission</a></li>
		            </ul>
		            <div class="clr"></div>
		          </div>
		          <h3 class="page-hd txtctr">Power Cozmo platform is simple, safe, realistic you can sell thorough below simple steps:</h3>
		          <div id="myTabContent1" class="tab-content txtctr">
		            <div class="tab-pane fade active in" id="how-one">
		              <h2 class="page-hd txtctr">How to Sell on <span>Power Cozmo?</span></h2>
		              <div class="ho-wrk-cnt">
		                <ul>
		                  <li>
		                    <div class="ho-wrk-lt">
		                      <div class="ho-wrk-img-bx">
		                        <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig.png"></div>
		                        <div class="ho-wrk-lin"></div>
		                        <div class="ho-wrk-number">1</div>
		                      </div>
		                    </div>
		                    <div class="ho-wrk-rt">
		                      <h2>Register on Power Cozmo</h2>
		                      <p>You simply register in Power Cozmo, Then Go to your awesome dashboard And post your equipment to buyers by click on "Add New Listing" you will be asked to add description, price and photograph of the item you wish to sell. After that your item is published on our website. If it is need We contact you to gather any further information and to answer any raised questions.</p>
		                    </div>
		                  </li>
		                  <li>
		                    <div class="ho-wrk-lt">
		                      <h2>Start Receiving questions &amp; offers</h2>
		                      <p>When an interested party see your Item. He may at this time ask any questions raised or pass on any offers made by him, then you will reply to his question or offers directly from your dashboard. You and potentials buyer can communicate directly through our automated platform.</p>
		                    </div>
		                    <div class="ho-wrk-rt">
		                      <div class="ho-wrk-img-bx">
		                        <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig2.png"></div>
		                        <div class="ho-wrk-lin"></div>
		                        <div class="ho-wrk-number">2</div>
		                      </div>
		                    </div>
		                  </li>
		                  <li>
		                    <div class="ho-wrk-lt">
		                      <div class="ho-wrk-img-bx">
		                        <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig3.png"></div>
		                        <div class="ho-wrk-lin"></div>
		                        <div class="ho-wrk-number">3</div>
		                      </div>
		                    </div>
		                    <div class="ho-wrk-rt">
		                      <h2>Start Finalizing the deal - Signing agreements</h2>
		                      <p>When the Potential Buyer is satisfied and the price is agreed, a seller/buyer agreement is sent to the buyer and seller. The buyer is asked to return the signed agreement along with the payment which will be deposited in our Customer Trust Account. Also We agree on the commission structure and length of commitment and forward you a Sales Agent Agreement.</p>
		                    </div>
		                  </li>
		                  <li>
		                    <div class="ho-wrk-lt">
		                      <h2>Prepare item for shipping</h2>
		                      <p>While the payment is clearing the bank you will be sent the seller/buyer contract to sign and return. You should be preparing the item for shipment at this time. Power Cozmo can assist with this process. see our servicess.</p>
		                    </div>
		                    <div class="ho-wrk-rt">
		                      <div class="ho-wrk-img-bx">
		                        <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig4.png"></div>
		                        <div class="ho-wrk-lin"></div>
		                        <div class="ho-wrk-number">4</div>
		                      </div>
		                    </div>
		                  </li>
		                  <li>
		                    <div class="ho-wrk-lt">
		                      <div class="ho-wrk-img-bx">
		                        <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig5.png"></div>
		                        <div class="ho-wrk-lin"></div>
		                        <div class="ho-wrk-number">5</div>
		                      </div>
		                    </div>
		                    <div class="ho-wrk-rt">
		                      <h2>Get your money in your account</h2>
		                      <p>Within 24 hours after the item is received by the buyer you will be sent payment less any commission, bank charges, taxes, shipping and Added Services or other costs directly incurred by Power Cozmo for that particular transaction.</p>
		                    </div>
		                  </li>
		                </ul>
		              </div>
		            </div>
		            <div class="tab-pane fade" id="how-two">
		            	 <h2 class="page-hd txtctr">How to Buy from <span>Power Cozmo?</span></h2>
		              <div class="ho-wrk-cnt">
		                <ul>
		                  <li>
		                    <div class="ho-wrk-lt">
		                      <div class="ho-wrk-img-bx">
		                        <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig-buy1.png"></div>
		                        <div class="ho-wrk-lin"></div>
		                        <div class="ho-wrk-number">1</div>
		                      </div>
		                    </div>
		                    <div class="ho-wrk-rt">
		                      <h2>Search &amp; find your equipment</h2>
		                      <p>First find the plant or the equipment you are interested in on our web site and click on ask the seller question button if you want further information. The Seller will get your massage and answer you directly through our Automated system also you will get copy of the answer in your mail inbox.</p>
		                    </div>
		                  </li>
		                  <li>
		                    <div class="ho-wrk-lt">
		                      <h2>Make an offer</h2>
		                      <p>Once you get all your questions answered click in “Make an offer button "and start on price negotiation</p>
		                    </div>
		                    <div class="ho-wrk-rt">
		                      <div class="ho-wrk-img-bx">
		                        <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig-buy2.png"></div>
		                        <div class="ho-wrk-lin"></div>
		                        <div class="ho-wrk-number">2</div>
		                      </div>
		                    </div>
		                  </li>
		                  <li>
		                    <div class="ho-wrk-lt">
		                      <div class="ho-wrk-img-bx">
		                        <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig-buy3.png"></div>
		                        <div class="ho-wrk-lin"></div>
		                        <div class="ho-wrk-number">3</div>
		                      </div>
		                    </div>
		                    <div class="ho-wrk-rt">
		                      <h2>Start Finalizing the deal - Sign agreements</h2>
		                      <p>When an offer is accepted and the price agreed, a seller/buyer agreement will be sent to you. You will at that time sign and return the agreement along with the payment which will be placed in our Customer Trust Account. For big projects we will accept Transferable L\C.Power Cozmo can assign third party inspector ex Bureau Veritas to make inspection for equipment. Optional See our services</p>
		                    </div>
		                  </li>
		                  <li>
		                    <div class="ho-wrk-lt">
		                      <h2>Prepare item for shipping</h2>
		                      <p>After seller sign the agreement Our logistic department will arrange with seller to get the materials prepared to shipping.</p>
		                    </div>
		                    <div class="ho-wrk-rt">
		                      <div class="ho-wrk-img-bx">
		                        <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig-buy4.png"></div>
		                        <div class="ho-wrk-lin"></div>
		                        <div class="ho-wrk-number">4</div>
		                      </div>
		                    </div>
		                  </li>
		                  <li>
		                    <div class="ho-wrk-lt">
		                      <div class="ho-wrk-img-bx">
		                        <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig-buy5.png"></div>
		                        <div class="ho-wrk-lin"></div>
		                        <div class="ho-wrk-number">5</div>
		                      </div>
		                    </div>
		                    <div class="ho-wrk-rt">
		                      <h2>Get your shipping document and receive the Item</h2>
		                      <p>Power Cozmo will send you shipping documents within materials expected arrival date. Money will be paid to seller within 24 hours from materials delivered to you.</p>
		                    </div>
		                  </li>
		                </ul>
		              </div>
		            </div>
		            <div class="tab-pane fade" id="how-three">
		            	 <h2 class="page-hd txtctr">How to <span>Pay?</span></h2>
		              <div class="ho-wrk-cnt">
		                <ul>
		                  <li>
		                    <div class="ho-wrk-lt">
		                      <div class="ho-wrk-img-bx">
		                        <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig-pay1.png"></div>
		                        <div class="ho-wrk-lin"></div>
		                        <div class="ho-wrk-number">1</div>
		                      </div>
		                    </div>
		                    <div class="ho-wrk-rt">
		                      <h2>T\T</h2>
		                      <p>T\T cash transfer to our Trusted costumer account.</p>
		                    </div>
		                  </li>
		                  <li>
		                    <div class="ho-wrk-lt">
		                      <h2>L\C</h2>
		                      <p>Transferable Irrevocable Confirmed L\C for big projects.</p>
		                    </div>
		                    <div class="ho-wrk-rt">
		                      <div class="ho-wrk-img-bx">
		                        <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig-pay2.png"></div>
		                        <div class="ho-wrk-lin"></div>
		                        <div class="ho-wrk-number">2</div>
		                      </div>
		                    </div>
		                  </li>
		                </ul>
		              </div>
		            </div>
		            <div class="tab-pane fade" id="how-four">
		            	<h2 class="page-hd txtctr">Commission <span>rate</span></h2>
		            <div class="commission-cnt">
		           	<div class="ho-wrk-lt">
		              <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig-commision.png"></div>
		            </div>
		              <div class="ho-wrk-rt">
		                <p>The commission due from you and payable by you to us shall be calculated by taking your total Sales Proceeds at the close of a transaction and applying such total toward the appropriate listing status and price range delineated below.</p>
		                <p>Sellers who list items on an exclusive basis will enjoy a %20 discount from the non-exclusive rate.
		                The following table outlines the declining commission schedule for Power Cozmo.</p>
			            </div>
		              <div class="clr"></div>
		              </div>
		              <div class="commission-rate-bg">
		              	<ul>
		                  <li>
		                    <div class="commission-rate-l">10%</div>
		                    <div class="commission-rate-r">$0 to $249,000</div>
		                    <div class="clr"></div>
		                  </li>
		                  <li>
		                    <div class="commission-rate-l">8%</div>
		                    <div class="commission-rate-r">$250,000 to $499,000</div>
		                    <div class="clr"></div>
		                  </li>
		                  <li>
		                    <div class="commission-rate-l">6%</div>
		                    <div class="commission-rate-r">$500,000 and Over</div>
		                    <div class="clr"></div>
		                  </li>
		                  <li>
		                    <div class="commission-rate-l">20%</div>
		                    <div class="commission-rate-r discount-seller-cnt">Discount for Exclusive Sellers</div>
		                    <div class="clr"></div>
		                  </li>
		                </ul>
		                <div class="clr"></div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</section>'},
	{title: 'Our services and logistic department.', url: 'our_service', content: '<section id="md" class="lst-midd-cnt">
		  <div class="wht-bg PT50">
		    <div class="container">
		      <div class="row">
		        <div class="col-lg-12 hwitwk-cnt logistc-department our-services-midd">
		          <p class="thxtal">We are not only broker we are service provider find what we can do for you</p>
		          <div class="ho-wrk-cnt bgnon">
		            <ul>
		              <li id="_inspection">
		                <span class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig3.png"></span>
		                <h2>Third party inspection</h2>
		                  <p>Up to buyer request we can appoint third party inspector ex: Bureau Veritas to make visual inspection to materials or more complicated inspection depends on customer
		                  requirements.</p>
		              </li>
		              <li id="_shipping">
		                <span class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig4.png"></span>
		                <h2>Shipping</h2>
		                <p>The cost for shipping, unless agreed otherwise, will be at the buyer side and will be calculated and added to materials cost. The responsibility for packaging and
		                prepare it to carrier is the Seller responsibility. Shipment will be done by Power Cozmo.</p>
		                <p>We will provide buyer with all necessary documents bill of lading or AWB and buyer will be informed about each step we do.</p>
		                <p>Upon receipt of shipment, please examine the packaging carefully to see whether or not the package has been opened or damaged. If there is any damage it must be noted on
		                the shipper’s bill of lading. The shipping company must be informed immediately and a claim filed. Your contract is your Invoice (Claim amount) needed to file your claim.
		                It might be useful to save the packaging materials and take photographs of the damage. Please notify the seller and RER immediately if this occurs. We will be willing to
		                assist you in any way possible.</p>
		                	<p><a href="/contacts/new">Contact Us</a> to find out how little it costs to move your equipment to buyer ! .</p>
		              </li>
		              <li id="_spare_parts">
		                <span class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig2.png"></span>
		                <h2>Refurbishing & spare parts</h2>
		                <p>Power Cozmo can source most parts for the power generation equipment at very competitive prices both mechanical and electrical.</p>
		                <p>We are specialized on Overhauling, Maintenance, Commissioning, Spare Parts Supply, Trouble Shooting, Buying-Selling and Relocation of existing Gas- and Steam Turbines,
		                Engines, Coal fired Power Plants, Oil- Refineries, Wind- and Solar Plants, Waste to Energy and Bio Energy Power Plants.</p>
		                <p>Get your equipment ready to sell in our refurbishing services .Contact us now !.</p>
		              </li>
		              <li id="_meeting_room">
		                <span class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig.png"></span>
		                <h2>Our Meeting Room</h2>
		                <p>Our private and fully equipped meeting facilities and boardrooms offer high class stylish business environments which cater to all your business needs. Sellers and
		                buyers can meet comfort of our corporate business rooms.</p>
		              </li>
		            </ul>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</section>'},
	{title: 'Why power Cozmo?', url: 'why_power_cozmo', content: '<section id="md" class="lst-midd-cnt">
		  <div class="wht-bg PT50">
		    <div class="container">
		      <div class="row">
		        <div class="col-lg-12 hwitwk-cnt">
		          <div class="hwitwk-tab">
		            <ul id="myTab1">
		              <li class="active"><a href="#how-one" data-toggle="tab">Sell</a></li>
		              <li class=""><a href="#how-two" data-toggle="tab">Buy</a></li>
		              <li class=""><a href="#how-three" data-toggle="tab">Protect</a></li>
		              <li class=""><a href="#how-four" data-toggle="tab">Equipment</a></li>
		               <li class=""><a href="#how-four1" data-toggle="tab">Trusted</a></li>
		            </ul>
		            <div class="clr"></div>
		          </div>
		          <div id="myTabContent1" class="tab-content txtctr informidd-cont">
		            <div class="tab-pane fade active in" id="how-one">
		              <h2 class="page-hd txtctr">WHY sell <span>POWER COZMO?</span></h2>
		              <div class="row">
		                <div class="col-lg-12 logistc-department inforgraph-midd">
		                  <div class="ho-wrk-cnt">
		                    <ul>
		                      <li>
		                        <div class="ho-wrk-lt">
		                          <h2>100% commission based structure</h2>
		                          <p>if we don’t sell your equipment you pay Nothing.</p>
		                        </div>
		                        <div class="ho-wrk-rt">
		                          <div class="ho-wrk-img-bx">
		                            <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig8.png"></div>
		                          </div>
		                        </div>
		                      </li>
		                      <li>
		                        <div class="ho-wrk-lt">
		                          <div class="ho-wrk-img-bx">
		                            <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig9.png"></div>
		                          </div>
		                        </div>
		                        <div class="ho-wrk-rt">
		                          <h2>Easy, painless processes.</h2>
		                          <p>Anyone can list equipment for sale, and get purchase bids, negotiate and complete transactions on our secure Automated system  Eyou just need to create a free account</p>
		                        </div>
		                      </li>
		                      <li>
		                        <div class="ho-wrk-lt">
		                          <h2>Global Reach.</h2>
		                          <p>We successfully market equipment worldwide on our filtered database and other best promotion tools.</p>
		                        </div>
		                        <div class="ho-wrk-rt">
		                          <div class="ho-wrk-img-bx">
		                            <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig10.png"></div>
		                          </div>
		                        </div>
		                      </li>
		                      <li>
		                        <div class="ho-wrk-lt">
		                          <div class="ho-wrk-img-bx">
		                            <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig11.png"></div>
		                          </div>
		                        </div>
		                        <div class="ho-wrk-rt">
		                          <h2>Secure escrow process</h2>
		                          <p>Seller does not release equipment until Power Cozmo has received full payment. We do not release payment to the seller until the buyer receives the equipment in the advertised condition.</p>
		                        </div>
		                      </li>
		                    </ul>
		                  </div>
		                </div>
		              </div>
		            </div>
		            <div class="tab-pane fade" id="how-two">
		              <h2 class="page-hd txtctr">WHY Buy <span>POWER COZMO?</span></h2>
		              <div class="row">
		                <div class="col-lg-12 logistc-department inforgraph-midd">
		                  <div class="ho-wrk-cnt">
		                    <ul>
		                      <li>
		                        <div class="ho-wrk-lt">
		                          <h2>No limits</h2>
		                          <p>No limit on the number of photos and <br>
		    information provided by sellers.</p>
		                        </div>
		                        <div class="ho-wrk-rt">
		                          <div class="ho-wrk-img-bx">
		                            <div class="ho-wrk-imgbig">
		                            <img src="/assets/ho-wrk-imgbig12.png"></div>
		                          </div>
		                        </div>
		                      </li>
		                      <li>
		                        <div class="ho-wrk-lt">
		                          <div class="ho-wrk-img-bx">
		                            <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig13.png"></div>
		                          </div>
		                        </div>
		                        <div class="ho-wrk-rt">
		                          <h2>Secure and safe processes</h2>
		                          <p>Your money is held by power cozmo and only released to the seller after the dispute deadline has passed.</p>
		                        </div>
		                      </li>
		                      <li>
		                        <div class="ho-wrk-lt">
		                          <h2>Open, transparent negotiations</h2>
		                          <p>Our Automated online negotiation system puts the fairness into private sale. You can ask seller questions and get answers, make offers to sellers in open secure system.</p>
		                        </div>
		                        <div class="ho-wrk-rt">
		                          <div class="ho-wrk-img-bx">
		                            <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig14.png"></div>
		                          </div>
		                        </div>
		                      </li>
		                      <li>
		                        <div class="ho-wrk-lt">
		                          <div class="ho-wrk-img-bx">
		                            <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig15.png"></div>
		                          </div>
		                        </div>
		                        <div class="ho-wrk-rt">
		                          <h2>Convenient services</h2>
		                          <p>Buyers can take advantage of other power Cozmo services. equipment financing, transportation, refurbishing, rehabilitation, third party inspection and other services</p>
		                        </div>
		                      </li>
		                    </ul>
		                  </div>
		                </div>
		              </div>
		            </div>
		            <div class="tab-pane fade" id="how-three">
		              <h2 class="page-hd txtctr">Find out How we <span>protect you?</span></h2>
		              <div class="three-prct-box">
		                <div class="row">
		                  <div class="col-lg-4">
		                    <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig16.png"></div>
		                  </div>
		                  <div class="col-lg-8 pull-right">
		                    <h3>Find out How we protect you?</h3>
		                    <ul>
		                    	<li>Trusted costumer account service to protect your cash.</li>
		                        <li>Third party inspection.</li>
		                        <li>Unlimited Questions and Answers.</li>
		                        <li>Unlimited photos and videos for the best online view.</li>
		                    </ul>
		                  </div>
		                </div>
		              </div>
		            </div>
		            <div class="tab-pane fade" id="how-four">
		            <h2 class="page-hd txtctr">How we market <span>your equipment.</span></h2>
		              <div class="three-prct-box">
		              <div class="row">
		                <div class="col-lg-4">
		                  <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig17.png"></div>
		                </div>
		                <div class="col-lg-8 pull-right">
		                <p>There\'s a big difference between a simple online listing and active marketing. When you sell on power Cozmo you reach every potential buyer—local and international, so you get the best results. We have a massive database of qualified buyers, and we target them with multi-channel, multi-lingual marketing, including:</p>
		                  <ul>
		                  	<li>Detailed listings on power Cozmo website</li>
		                      <li>Internet advertising</li>
		                      <li>Emails shot and direct mail</li>
		                      <li>Full-color brochures.</li>
		                      <li>Industry publication advertising  Eprint and online</li>
		                      <li>social media.</li>
		                  </ul>
		                  <p>Let power Cozmo bring the buyers to you , Register and list your equipment now.</p>
		                </div>
		              </div>
		              </div>
		            </div>
		            <div class="tab-pane fade" id="how-four1">
		            <h2 class="page-hd txtctr">Costumer <span>Trusted account</span></h2>
		              <div class="three-prct-box">
		              <div class="row">
		                <div class="col-lg-4">
		                  <div class="ho-wrk-imgbig"><img src="/assets/ho-wrk-imgbig18.png"></div>
		                </div>
		                <div class="col-lg-8 pull-right">
		                <p>Trusted costumer account safe your money. This is how it works:</p>
		                  <ul>
		                  	<li>You buy Equipment from Power Cozmo.</li>
		                      <li>You transfer the payment to us and we notify the seller.</li>
		                      <li>The seller prepares the item for shipping and Power Cozmo send material to you</li>
		                      <li>After your receive and inspect the materials we release your money to seller</li>
		                  </ul>
		                </div>
		              </div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</section>'},
	{title: 'Have a question for Power Cozmo? Fill out the request form and hit submit. A member of our team will respond to you within 24 hours during weekdays.', url: 'contact_us', content: '<div class="contact-info-txt">
                <p>Thank You for your interest. We buy and sell any and all types of surplus power Generation equipment We would be happy to help you recover lost assets or offload your businesses clutter and overstock. For Sales and </p>
                <ul class="contact-info-lst">
                  <li>For Sales and Purchasing inquiries: <br>  <a href="mailto:info@powercozmo.com">info@powercozmo.com</a></li>
                  <li>For spare Parts and services inquiries: <br> <a href="mailto:sales@powercozmo.com">sales@powercozmo.com</a></li>
                  <li>For Sales and Purchasing inquiries:  <br> <a href="mailto:info@powercozmo.com" title="Link: mailto:info@powercozmo.com">info@powercozmo.com</a></li>
                  <li>For any support or problem in website: <br> <a href="mailto:support@powercozmo.com" title="Link: mailto:support@powercozmo.com">support@powercozmo.com</a></li>
                </ul>
              </div>
							<div class="immediate-block">
               	<div class="immediate-block-l">
                  <div class="immediate-txt">For immediate assistance, phone our customer care team: </div>
                </div>
                <div class="immediate-block-r">
                	<div class="immeidate-phone">
                    	<img class="phone-icon" src="/assets/phone-icon.png"> XXXXXXX-1 or XXXXXXX <br>
                        <span>24 hour support</span>
                    </div>
                </div>
                <div class="clr"></div>
              </div>'}
]
StaticPage.create!(static_page_data)

puts "######################## Creating Faqs ########################"

faq_data = [
	{question: 'Why power Cozmo?', answer: 'Power Cozmo has a highly skilled staff ready to serve you. To learn more about power Cozmo visit our<a href="/#why-one"> Why us? </a>page and Welcome to power Cozmo page.', position: 1},
	{question: 'What services does Power Cozmo provide?', answer: '<ul><li> Sell & Buy Used and surplus power equipment</li><li> Overhaul & rehabilitation.</li><li> Reallocation and setup, For more information visit Our services pages.</li></ul>', position: 2},
	{question: 'How do I list an item I want to sell?', answer: 'To list an item through Power Cozmo you must first to register in site by clicking on register button in the top of page . Then you can list your equipment from your own dashboard , Equipment should be honestly described and pictures attached. The selling price should be in US dollars or Euro . A qualified staff person will contact you to go over the details, answer any questions and finalize the commission structure. When the agreement is signed your item is posted to the web site.', position: 3},
	{question: 'How do I buy a listed item?', answer: 'You can click on buying now button and fill out the form and we contact you shortly , also if you have any raised question or need price negotiation with seller you can do that through our automated platform', position: 4},
	{question: 'I’m looking for an item that is not on your equipment for sale list.:', answer: 'If you are looking for an item we do not currently have on our inventory list simply You can fill out the “Buying request form Eby clicking on buying request button found in the top of the page.. We will notify you as soon as it becomes available.', position: 5},
	{question: 'How do I pay for an item?', answer: 'Payment can be made by Wire transfer , or by Letter of credit (L\C).', position: 6},
	{question: 'As a buyer, what other costs might I have to pay over and above the listed or negotiated price?', answer: 'The cost for shipping, insurance and applicable sales tax, unless agreed otherwise, will be at your expense and will be included with your item payment. If there are any other costs they will be negotiated and documented in your seller/buyer agreement.', position: 7},
	{question: 'How do I figure out shipping?', answer: 'We are provided the weight and physical dimensions of the item to be shipped so that shipping costs can be calculated and quoted. If the item being shipped is in more than one package the number of packages with their individual weights and dimensions will be made known.', position: 8},
	{question: 'Does Power Cozmo ship internationally?', answer: 'Yes. Power Cozmo services all markets both domestic and international and can containerize and crate all machinery for export.', position: 9},
	{question: 'Should I be concerned about purchasing used equipment?', answer: 'No. Remember, every piece of equipment in your plant is a piece of used equipment. You should not hesitate to buy used equipment from a reliable source.', position: 10},
	{question: 'Do I have the right to return an equipment?', answer: 'Yes. Most machines come with our "right to return policy E visit our<a href="/our-policy"> Warranty and Returns Policy</a> page for more information.', position: 11},
	{question: 'Can I trade in a machine?', answer: 'Yes. If the machine is of good quality, there is nothing wrong with "horse trading."', position: 12}
]

Faq.create!(faq_data)

puts "######################## Creating Good-to-know data ########################"

good_to_know_data = [
	{question: 'Why Buy Used?', answer: '<p>There are a number of benefits to shopping our inventory of used power equipment. Buying used means more equipment for your purchasing dollar. Instead of settling for a lesser quality unit, buying used gives you the opportunity to get the equipment you want waithout waiting months or years for manufacturing processes.</p>', position: 1, name: 'why-buy-used'},
	{question: 'A few things to remember before buying used equipment', answer: '<ul>
  	<li> All bids are final. You cannot file a dispute or return an item if you change your mind.
    </li>
    <li> All of the items on Power Cozmo are sold "as-is, where-is" with no representations, warranties or expectations other than what you see and read on the item\'s
      listing page, which includes the description, condition, photos, posted lot Q&A, etc.
    </li>
    <li> A minor discrepancy is not considered a valid reason to file a dispute (for example, the unit was advertised as having 10,000 hours and it has 10,100 hours).
    </li>
    <li> Damage that occurs during removal or transportation of the item purchased is not covered.
    </li>
  	</ul>', position: 2, name: 'before-buy-tips'},
	{question: 'Dispute resolution doesn\'t have to be complicated.', answer: '<ul>
  	<li>You can make a dispute claim within two business days after the removal date, if:
      <ul start="1.1" class="good-know-secend">
      	<li>The equipment is not available for removal</li>
          <li>You can’t take ownership because the equipment has an undisclosed lien or was stolen, or the seller does not disclose the fact that a title/certificate
          of ownership/registration is not available (note: many items are sold without titles)</li>
          <li>The equipment’s usage (hours/mileage) is substantially higher than disclosed</li>
      </ul>
    </li>
    <li> We manage disputes in cases of seller misrepresentation and help buyers and sellers reach mutual agreement, which may or may not involve a full or partial
    refund</li>
    <li> Members who violate our user agreement will be penalized and fined, and may have buying/selling privileges revoked</li>
    <li> Please note: items are sold as-is, where-is. Sellers are responsible for creating their own lots. Power Cozmo does not warrant the condition of any items nor
    the accuracy of lots.</li>
  	</ul>', position: 3, name: ''},
	{question: 'Tips for buying used power equipment', answer: '<ul><li><span>Research is crucial</span>
		<p>Before buying any used equipment, you should do your research. What is the best type of equipment for your needs? What is the best manufacturer in your 																		 										industry? How large does the machinery have to be to suit your needs? Try to answer every possible question, so that you can make an informed decision. This 										will also keep you away from scams.</p></li>
		<li><span>Know what you need</span>
		<p>You have to know what you need exactly. When we talk about industrial equipment, even a few centimeters matter and can add up to more money than you 			 											expect. If you are looking for metal studs of 8 centimeters, for example, and you simply use a picture of them when looking for used studs, you might  		 											find out that the ones you have bought do not fit the way they should. The worst part is that you cannot return the product. That is why taking exact    										measurements and knowing what you need is crucial.</p></li>
		 <li><span>Used or refurbished?</span>
			<p>These are two crucial terms when it comes to sales. The used equipment has already been used and resold, and it is completely functional. The refurbished  										equipment has been sent to the manufacturer to be inspected for a resale. So, next time remember to look for refurbished equipment instead of used items.
		    Pay attention to these tips when buying used equipment and you will be able to avoid being tricked by sellers. This will help you get the exact product that  										you need.</p></li>
		<li><span>Operating hours</span>
		 	<p>How many hours the equipment has operated for isn\'t the only factor you should consider when evaluating a machine\'s condition but, as with looking at miles when shopping for a car, it\'s a good place to start.</p>
			<p>A diesel-engine machine can last into the tens of thousands of operating hours. If you think it may be pushing the upper limits of hours then you may want to do a quick cost/benefit calculation. This will help you to determine if the money you\'re saving on an older machine is going to be worth the additional maintenance cost of taking care of something that may break down more often.</p>
		 	<p>Keep in mind that regular maintenance is still important. A machine with 1,000 operating hours that hasn\'t been well maintained may be a worse buy than a machine with 15,000 hours.</p></li></ul>', position: 4, name: 'tips-for-buyer'},
	{question: 'Tips of selling used power equipment', answer: '<ul><li><span>Stop the scavenger hunts</span>
	    <p>A factory’s maintenance and engineering team focuses on keeping a facility running. At times, this means "raiding" idle machinery for spare parts to repair  	 										other units. These raids, however, hurt the resale process, raising questions with buyers such as, "What is missing that I haven’t noticed?" Selling used    										machinery that is still installed is critical; it prevents the scavenging that makes controllers, PLCs, drives, parts and resale value from being lost.
	    </p></li>
			<li><span>More time = More money</span>
	    <p>By giving your dealer or asset management company plenty of time to do their job, they can create more interest in an item, thus assuring a competitive sale  										price. So, as soon as the decision is made to either redeploy or to sell machinery, let your machinery dealer or asset management partner know so he is able 										to do the best job possible. </p></li>
	    <li><span>Remember the spares</span>
	    <p>As the price of OEM spare parts keeps spiraling upward, the spare parts you have are a benefit to buyers. Providing spare parts also shows new customers how   									   the machinery was maintained and what components were areas of concern.</p></li>
	    <li><span>Keep the manuals and prints</span>
	    <p>This seems like an obvious suggestion, but you would be surprised by the number of liquidations and redeployments we perform where the machine’s literature 						 										is missing. Manuals and prints are valued by the next user, and speed along the resale process.</p></li>
	    <li><span>Handle with care</span>
	    <p>When you remove machinery from your plant, treat it well. For instance, one company moved idle machinery from two different warehouses without building skids  										to help the process. The move damaged some items and now, the repair costs overshadow the equipment’s value. Idle assets need to be treated with care.
	    </p></li>
	    <li><span>Snap away</span>
	    <p>We all know a picture is worth a thousand words. When dealing with idle assets and used equipment, a picture can also be worth thousands of dollars. A   			 										photograph lets anyone interested in your equipment see how you maintained the machinery at a glance, along with showing the unit’s options and strengths.
	    </p></li>
	    <li><span>Make reassembly easy</span>
	     <p>A simple "snip" can create tens of thousands of dollars in electrical work. When you disconnect idle machines, make sure you prepare them to be reinstalled,   										so they show up at their next facility in good condition, like you would want them to show up at your own door. Instead of cutting through electrical cords,  										disconnect and label them.</p></li>
	    <li><span>Keep samples of the package</span>
	    <p>Change parts used with packaging machinery are only valuable if someone else can use them. Since these parts often work with odd-sized containers, we tell
	    our clients to include sample containers with each set of change parts, giving buyers an idea of the part’s distinct capabilities. Some customers even take a
	    sample and tape it to the change parts; this makes referencing easy and lets buyers know more than just the size it was last used on.</p></li>
	    <li><span>Clean your machine</span>
	    <p>First impressions count, so present the best-looking machinery possible. A good machine that looks like it’s in bad shape may not be redeployed or reviewed
	    in detail. Customers may feel you didn’t maintain its quality, causing interest to wane.</p></li></ul>', position: 5, name: 'tips-for-seller'}
]

GoodToKnow.create!(good_to_know_data)

puts "######################## Creating Advertisements ########################"

advertisements_data = [
	{title: 'Listing top', page_reference: 'listing top horizontal'},
	{title: 'Listing left', page_reference: 'listing left panel'},
	{title: 'Listing details top', page_reference: 'listing details top horizontal'},
	{title: 'Listing details right', page_reference: 'listing details right panel'}
]

Advertisement.create!(advertisements_data)

puts "######################## Creating Equipment data ########################"
e1 = Equipment.create!(name: 'Engines', equipment_model: 'eq1', condition: 'New', owner_name: 'user1', manufacturer_id: 1, category_id: 28, sub_category_id: 29, sub_sub_category_id: 30, city: 'Chicago', country_id: 1, price: '1000', currency: '&#1583;.&#1573;', rating: 3, description: 'Test description1', status: 1, availble_for: Date.tomorrow, manufacture_year: '2010',equipment_type: 'equipment', user_id: User.first.try(:id))
    ee1 = e1.equipment_enquiries.create!(name: 'test1', email: 'user1@example.com', mobile: '1234567890', country_id: 1, company_name: 'company1', company_website: 'https://www.example.com', message: 'Test message', bidding_price: 1000, enquiry_type: 2)
e2 = Equipment.create!(name: 'Generators', equipment_model: 'eq2', condition: 'New', owner_name: 'user2', manufacturer_id: 2, category_id: 28, sub_category_id: 29, sub_sub_category_id: 30, city: 'Boston', country_id: 2, price: '2000', currency: '&#65;&#102;', rating: 4, description: 'Test description2', status: 1, availble_for: Date.tomorrow, manufacture_year: '2011',equipment_type: 'equipment', user_id: User.first.try(:id))
    ee2 = e2.equipment_enquiries.create!(name: 'test2', email: 'user2@example.com', mobile: '1234567890', country_id: 2, company_name: 'company2', company_website: 'https://www.example.com', message: 'Test message', bidding_price: 2000, enquiry_type: 2)
e3 = Equipment.create!(name: 'Excitation systems', equipment_model: 'eq3', condition: 'New', owner_name: 'user3', manufacturer_id: 3, category_id: 28, sub_category_id: 29, sub_sub_category_id: 30, city: 'Las Vegas', country_id: 3, price: '3000', currency: '&#76;&#101;&#107;', rating: 3, description: 'Test description3', status: 1, availble_for: Date.tomorrow, manufacture_year: '2009',equipment_type: 'equipment', user_id: User.first.try(:id))
    ee3 = e3.equipment_enquiries.create!(name: 'test3', email: 'user3@example.com', mobile: '1234567890', country_id: 3, company_name: 'company3', company_website: 'https://www.example.com', message: 'Test message', enquiry_type: 1)
e4 = Equipment.create!(name: 'Gas Compressors', equipment_model: 'eq4', condition: 'New', owner_name: 'user4', manufacturer_id: 4, category_id: 28, sub_category_id: 29, sub_sub_category_id: 30, city: 'Chicago', country_id: 4, price: '4000', currency: '&#402;', rating: 4, description: 'Test description4', status: 1, availble_for: Date.tomorrow, manufacture_year: '2012',equipment_type: 'equipment', user_id: User.first.try(:id))
    ee4 = e4.equipment_enquiries.create!(name: 'test4', email: 'user4@example.com', mobile: '1234567890', country_id: 4, company_name: 'company4', company_website: 'https://www.example.com', message: 'Test message', enquiry_type: 1)
e5 = Equipment.create!(name: 'Turbines', equipment_model: 'eq5', condition: 'New', owner_name: 'user5', manufacturer_id: 5, category_id: 28, sub_category_id: 29, sub_sub_category_id: 30, city: 'Boston', country_id: 5, price: '5000', currency: '&#75;&#122;', rating: 5, description: 'Test description5', status: 1, availble_for: Date.tomorrow, manufacture_year: '2010',equipment_type: 'equipment', user_id: User.first.try(:id))
    ee5 = e5.equipment_enquiries.create!(name: 'test5', email: 'user5@example.com', mobile: '1234567890', country_id: 5, company_name: 'company5', company_website: 'https://www.example.com', message: 'Test message', enquiry_type: 3)
e6 = Equipment.create!(name: 'Generators', equipment_model: 'eq6', condition: 'New', owner_name: 'user5', manufacturer_id: 5, category_id: 28, sub_category_id: 29, sub_sub_category_id: 30, city: 'Las Vegas', country_id: 6, price: '5000', currency: '&#75;&#122;', rating: 4, description: 'Test description6', status: 1, availble_for: Date.tomorrow, manufacture_year: '2015',equipment_type: 'equipment', user_id: User.first.try(:id))
    ee6 = e6.equipment_enquiries.create!(name: 'test6', email: 'user6@example.com', mobile: '1234567890', country_id: 6, company_name: 'company6', company_website: 'https://www.example.com', message: 'Test message', enquiry_type: 3)
e7 = Equipment.create!(name: 'Gas Compressors', equipment_model: 'eq7', condition: 'New', owner_name: 'user5', manufacturer_id: 2, category_id: 28, sub_category_id: 47, sub_sub_category_id: 48, city: 'Garland', country_id: 6, price: '6000', currency: '&#75;&#122;', rating: 3, description: 'Test description7', status: 1, availble_for: Date.tomorrow, manufacture_year: '2015',equipment_type: 'equipment', user_id: User.second.try(:id))
    ee7 = e7.equipment_enquiries.create!(name: 'test7', email: 'user7@example.com', mobile: '1234567890', country_id: 7, company_name: 'company7', company_website: 'https://www.example.com', message: 'Test message', enquiry_type: 1)
e8 = Equipment.create!(name: 'Engines', equipment_model: 'eq8', condition: 'New', owner_name: 'user8', manufacturer_id: 4, category_id: 28, sub_category_id: 47, sub_sub_category_id: 48, city: 'Chicago', country_id: 8, price: '7000', currency: '&#65;&#102;', rating: 3, description: 'Test description8', status: 1, availble_for: Date.tomorrow, manufacture_year: '2011',equipment_type: 'equipment', user_id: User.second.try(:id))
    ee8 = e8.equipment_enquiries.create!(name: 'test8', email: 'user8@example.com', mobile: '1234567890', country_id: 8, company_name: 'company8', company_website: 'https://www.example.com', message: 'Test message', enquiry_type: 1)
e9 = Equipment.create!(name: 'Excitation systems', equipment_model: 'eq9', condition: 'New', owner_name: 'user9', manufacturer_id: 4, category_id: 28, sub_category_id: 47, sub_sub_category_id: 48, city: 'Boston', country_id: 9, price: '9000', currency: '&#65;&#102;', rating: 4, description: 'Test description9', status: 1, availble_for: Date.tomorrow, manufacture_year: '2013',equipment_type: 'equipment', user_id: User.second.try(:id))
    ee9 = e9.equipment_enquiries.create!(name: 'test9', email: 'user9@example.com', mobile: '1234567890', country_id: 9, company_name: 'company9', company_website: 'https://www.example.com', message: 'Test message', enquiry_type: 2, bidding_price: 5000)
e10 = Equipment.create!(name: 'Generators', equipment_model: 'eq10', condition: 'New', owner_name: 'user10', manufacturer_id: 2, category_id: 28, sub_category_id: 47, sub_sub_category_id: 48, city: 'Las Vegas', country_id: 10, price: '10000', currency: '&#75;&#122;', rating: 4, description: 'Test description10', status: 1, availble_for: Date.tomorrow, manufacture_year: '2013',equipment_type: 'equipment', user_id: User.second.try(:id))
    ee10 = e10.equipment_enquiries.create!(name: 'test10', email: 'user10@example.com', mobile: '1234567890', country_id: 10, company_name: 'company10', company_website: 'https://www.example.com', message: 'Test message', enquiry_type: 2, bidding_price: 6599)
e11 = Equipment.create!(name: 'Valves', equipment_model: 'eq11', condition: 'New', owner_name: 'user11', manufacturer_id: 3, category_id: 28, sub_category_id: 47, sub_sub_category_id: 48, city: 'Garland', country_id: 11, price: '11000', currency: '&#402;', rating: 2, description: 'Test description11', status: 1, availble_for: Date.tomorrow, manufacture_year: '2014',equipment_type: 'equipment', user_id: User.second.try(:id))
    ee11 = e11.equipment_enquiries.create!(name: 'test11', email: 'user11@example.com', mobile: '1234567890', country_id: 11, company_name: 'company11', company_website: 'https://www.example.com', message: 'Test message', enquiry_type: 3)
e12 = Equipment.create!(name: 'Engines', equipment_model: 'eq12', condition: 'New', owner_name: 'user12', manufacturer_id: 4, category_id: 28, sub_category_id: 47, sub_sub_category_id: 48, city: 'Chicago', country_id: 12, price: '12000', currency: '&#76;&#101;&#107;', rating: 4, description: 'Test description12', status: 1, availble_for: Date.tomorrow, manufacture_year: '2008',equipment_type: 'equipment', user_id: User.second.try(:id))
    ee12 = e12.equipment_enquiries.create!(name: 'test12', email: 'user12@example.com', mobile: '1234567890', country_id: 12, company_name: 'company12', company_website: 'https://www.example.com', message: 'Test message', enquiry_type: 3)

puts "######################## Creating Buying Request data ########################"

b_req1 = BuyingRequest.create!(title: 'test1', origin: 'USA', location_id: 2, brand_id: 4, category_id: 2, lead_type: 'Supplying', condition: '2', expiration_date: Date.tomorrow, attachment: File.open(Rails.root.to_s + '/app/assets/images/dummy-file.pdf', 'rb'), end_user: 'user1', city: 'Chicago', image: File.open(Rails.root.to_s + '/app/assets/images/cdt-prfl.jpg', 'rb'), description: 'test description', name: 'user1', email: 'user1@example.com', mobile: '1234567890', country_id: 3, company_name: 'company1', company_website: 'https://www.example.co.in', address: 'address1', status: 'New')

	b_req_details1 = b_req1.buying_request_more_details.create!(receiver: b_req1.email, subject: b_req1.title, message: 'New test message', attachment:  File.open(Rails.root.to_s + '/app/assets/images/dummy-file.pdf', 'rb'), user_id: 1, status: 'New')

	b_proposal1 = b_req1.buying_proposals.create!(proposal: 'New proposal1', price: 1000, delivery_time: "3", currency_id: 20, user_id: 1, status: 'New')

b_req2 = BuyingRequest.create!(title: 'test2', origin: 'Russia', location_id: 3, brand_id: 0, category_id: 4, lead_type: 'Turnkey', condition: '3', expiration_date: Date.tomorrow, attachment: File.open(Rails.root.to_s + '/app/assets/images/dummy-file.pdf', 'rb'), end_user: 'user2', city: 'Las Vegas', image: File.open(Rails.root.to_s + '/app/assets/images/cdt-prfl.jpg', 'rb'), description: 'test description', name: 'user2', email: 'user2@example.com', mobile: '1234567890', country_id: 2, company_name: 'company2', company_website: 'https://www.example.co.in', address: 'address2', status: 'Approved')

	b_req_details2 = b_req2.buying_request_more_details.create!(receiver: b_req2.email, subject: b_req2.title, message: 'New test message', attachment:  File.open(Rails.root.to_s + '/app/assets/images/dummy-file.pdf', 'rb'), user_id: 2, status: 'Approved')

	b_proposal2 = b_req2.buying_proposals.create!(proposal: 'New proposal2', price: 8000, delivery_time: "6", currency_id: 50, user_id: 1, status: 'New')

puts "######################## Creating Commission data ##########################"

commission1 = Commission.create!(:name => "Low", :min_price => 0, :max_price => 249999, :percent => 10, :status => "active")
commission2 = Commission.create!(:name => "Medium", :min_price => 250000, :max_price => 499999, :percent => 8, :status => "active")
commission3 = Commission.create!(:name => "High", :min_price => 500000, :max_price => 1000000, :percent => 6, :status => "active")

puts "######################## Creating Sample Orders ##########################"
order1 = Equipment.first.orders.create!(price: 200, name: 'test1', email: 'test1@example.com', mobile: '1234567890', country_id: 1, company_website: 'example.com', company_name: 'example', commission: 10,status: 'Seller Confirmed')
order2 = Equipment.second.orders.create!(price: 400, name: 'test2', email: 'test2@example.com', mobile: '1234567890', country_id: 5, company_website: 'example.com', company_name: 'example', commission: 12.36,status: 'Seller Confirmed')
order3 = Equipment.first(3).last.orders.create!(price: 800, name: 'test3', email: 'test3@example.com', mobile: '1234567890', country_id:7, company_website: 'example.com', company_name: 'example', commission: 41.2,status: 'Seller Confirmed')
order4 = Equipment.first(4).last.orders.create!(price: 1200, name: 'test4', email: 'test4@example.com', mobile: '1234567890', country_id: 3, company_website: 'example.com', company_name: 'example', commission: 15,status: 'Seller Confirmed')
order5 = Equipment.first(5).last.orders.create!(price: 700, name: 'test5', email: 'test5@example.com', mobile: '1234567890', country_id: 9, company_website: 'example.com', company_name: 'example', commission: 12.36,status: 'Seller Confirmed')

puts '######################### Creating Contact Request data###################'

cr1 = Contact.create(first_name: "John", last_name: "Doe", email: "john@example.com", phone: "9998887779", subject: "Enquiry about registration process", message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", status: "New")
cr2 = Contact.create(first_name: "Jane", last_name: "Doe", email: "jane@example.com", phone: "9998886669", subject: "Enquiry about buying process", message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", status: "Replied")
cr3 = Contact.create(first_name: "John", last_name: "marshall", email: "marshall@example.com", phone: "9998885559", subject: "Enquiry about selling process", message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", status: "New")
