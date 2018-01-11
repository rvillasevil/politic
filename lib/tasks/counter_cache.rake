desc 'Counter cache for users has many followers'

task follower_counter: :environment do 
	User.reset_column_information
	User.pluck(:id).each  do |x|
		User.reset_counters x.id, :followers
	end
end