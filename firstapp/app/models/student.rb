class Student < ApplicationRecord
	after_initialize do |student|
		puts "Tao mot obj moi"
	end
	after_find do |student|
		puts "tim thay mot obj"
	end
end
