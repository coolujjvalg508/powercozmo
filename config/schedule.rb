# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "#{Whenever.path}/log/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
every 1.day, :at => '12:01 am' do
	rake "expire_notification:equipment:post_expired"
	rake "expire_notification:buying_request:to_buyer"
	rake "expire_notification:buying_request:to_admin"
	rake "expire_notification:buying_request:to_seller"
end

#every 1.day, :at => '09:00 am' do
every 10.minutes do
	rake "newsletter:equipment_suggestion:to_user"
end


# Learn more: http://github.com/javan/whenever
