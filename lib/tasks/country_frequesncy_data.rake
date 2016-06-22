require 'rake'
namespace :static_page do
	task :create_country_frequency_data => :environment do
		country_frequency = StaticPage.create!(title: 'Country Frequency', url: 'country_frequency', content: '<center>
			<table width="770" cellpadding="8" cellspacing="0" bgcolor="#ffffff" style="page-break-before: always">
				<colgroup><col width="253">
				<col width="168">
				<col width="119">
				<col width="166">
				</colgroup><tbody><tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p><b>Country</b></p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p><b>Three-phase voltage (volts)</b></p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p><b>Frequency (hertz)</b></p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p><b>Number of wires (not including the ground wire)</b></p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Abu Dhabi</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Afghanistan</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p><a name="_GoBack"></a>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Albania</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Algeria</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>American Samoa</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>208 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Andorra</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Angola</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Anguilla</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>120/208 V / 127/220 V / 240/415 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Antigua and Barbuda</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Argentina</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Armenia</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Aruba</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>220 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Australia</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Austria</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Azerbaijan</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Azores</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Bahamas</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>208 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Bahrain</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Balearic Islands</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Bangladesh</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Barbados</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>200 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Belarus</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Belgium</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Belize</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>190 V / 380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Benin</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Bermuda</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>208 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Bhutan</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Bolivia</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Bonaire</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>220 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Bosnia &amp; Herzegovina</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Botswana</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Brazil</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>220 V / 380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>British Virgin Islands</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>190 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Brunei</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Bulgaria</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Burkina Faso</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Burma&nbsp;<i>(officially Myanmar)</i></p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Burundi</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Cambodia</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Cameroon</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Canada</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>120/208 V / 240 V / 480 V / 347/600 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Canary Islands</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Cape Verde</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Cayman Islands</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>240 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Central African Republic</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Chad</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Channel Islands (Guernsey &amp; Jersey)</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Chile</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>China, People’s Republic of</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Colombia</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>220 V / 440 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Comoros</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Congo, Democratic Republic of</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Congo, People’s Republic of</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Cook Islands</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Costa Rica</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>240 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Côte d’Ivoire (Ivory Coast)</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Croatia</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Cuba</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>190 V / 440 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Curaçao</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>220 V / 380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Cyprus</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Czech Republic</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Denmark</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Djibouti</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Dominica</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Dominican Republic</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>120/208 V / 277/480 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Dubai</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>East Timor (Timor-Leste)</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Ecuador</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>208 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Egypt</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>El Salvador</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>200 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>England</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Equatorial Guinea</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Eritrea</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Estonia</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Ethiopia</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Faeroe Islands</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Falkland Islands</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Fiji</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Finland</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>France</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>French Guiana</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Gabon (Gabonese Republic)</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Gambia</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Gaza</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Georgia</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Germany</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Ghana</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Gibraltar</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Great Britain (GB)</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Greece</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Greenland</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Grenada</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Guadeloupe</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Guam</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>190 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Guatemala</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>208 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Guinea</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Guinea-Bissau</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Guyana</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>190 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Haiti</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>190 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Holland&nbsp;<i>(officially the Netherlands)</i></p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Honduras</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>208 V / 230 V / 240 V / 460 V / 480 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Hong Kong</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Hungary</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Iceland</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>India</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Indonesia</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Iran</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Iraq</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Ireland (Eire)</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Ireland, Northern</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Isle of Man</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Israel</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Italy</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Jamaica</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>190 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Japan</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>200 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz / 60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Jordan</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Kazakhstan</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Kenya</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Kiribati</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Korea, North</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Korea, South</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Kosovo</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>230 V / 400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Kuwait</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Kyrgyzstan</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Laos</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Latvia</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Lebanon</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Lesotho</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Liberia</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>208 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Libya</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Liechtenstein</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Lithuania</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Luxembourg</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Macau</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Macedonia, Republic of (the former Yugoslav Republic of
						Macedonia, FYROM)</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Madagascar</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Madeira</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Malawi</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Malaysia</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Maldives</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Mali</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Malta</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Marshall Islands</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Martinique</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Mauritania</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>220 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Mauritius</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Mayotte</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Mexico</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>220 V / 480 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Micronesia, Federated States of</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Moldova</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Monaco</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Mongolia</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Montenegro</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Montserrat</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Morocco</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Mozambique</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Myanmar&nbsp;<i>(formerly Burma)</i></p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Namibia</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Nauru</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Nepal</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Netherlands</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>New Caledonia</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>New Zealand</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Nicaragua</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>208 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Niger</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Nigeria</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Northern Ireland</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>North Korea</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Norway</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>230 V / 400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Oman</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Pakistan</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Palau</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>208 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Panama</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>240 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Papua New Guinea</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Paraguay</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Peru</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>220 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Philippines</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Pitcairn Islands</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Poland</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Portugal</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Puerto Rico</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>480 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Qatar</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Réunion</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Romania</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Russia&nbsp;<i>(officially the Russian Federation)</i></p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Rwanda</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Saba</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Saint Barthélemy&nbsp;<i>(informally also referred to as
						Saint Barth’s or Saint Barts)</i></p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Saint Kitts and Nevis&nbsp;<i>(officially the Federation of
						Saint Christopher and Nevis)</i></p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Saint Lucia</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Saint Martin</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Saint Helena</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Sint Eustatius</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>220 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Sint Maarten</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>220 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Saint Vincent and the Grenadines</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Samoa</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>San Marino</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>São Tomé and Príncipe</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Saudi Arabia</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Scotland</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Senegal</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Serbia</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Seychelles</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>240 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Sierra Leone</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Singapore</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Slovakia</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Slovenia</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Solomon Islands</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>[unavailable]</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Somalia</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Somaliland</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>South Africa</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>South Korea</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>South Sudan</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Spain</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Sri Lanka</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Sudan</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Suriname</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>220 V / 400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Swaziland</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Sweden</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Switzerland</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Syria</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Tahiti</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz / 60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Taiwan</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>220 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Tajikistan</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Tanzania</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Thailand</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Togo</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Tonga</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Trinidad &amp; Tobago</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>115/230 V / 230/400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Tunisia</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Turkey</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Turkmenistan</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Turks and Caicos Islands</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>240 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Uganda</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Ukraine</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>United Arab Emirates (UAE)</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>United Kingdom (UK)</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>United States of America (USA)</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>120/208 V / 277/480 V / 120/240 V / 240 V / 480 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>United States Virgin Islands</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>190 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Uruguay</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Uzbekistan</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Vanuatu</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Venezuela</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>120 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Vietnam</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>380 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Virgin Islands (British)</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>190 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Virgin Islands (USA)</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>190 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>60 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Wales</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Yemen</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Zambia</p>
					</td>
					<td width="168" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>400 V</p>
					</td>
					<td width="119" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#f9fafb" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>4</p>
					</td>
				</tr>
				<tr valign="top">
					<td width="253" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>Zimbabwe</p>
					</td>
					<td width="168" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>415 V</p>
					</td>
					<td width="119" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>50 Hz</p>
					</td>
					<td width="166" bgcolor="#ffffff" style="border-top-width: 1.5pt; border-style: solid none none; border-top-color: rgb(238, 240, 240); padding: 0.21cm 0cm 0cm;">
						<p>3, 4</p>
					</td>
				</tr>
			</tbody></table>
		</center>')
	end
end
