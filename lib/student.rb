class Student
	attr_accessor :first_name, :last_name, :courses

	def initialize(first_name, last_name, courses = [])
		@first_name = first_name
		@last_name = last_name
		@courses = courses
	end

	def name
		"#{@first_name.capitalize} #{@last_name.capitalize}"
	end

	def enroll(new_course)
		if courses.include?(new_course)
			return
		end

		courses.each do |course|
			raise 'Course conflict!' if course.conflicts_with?(new_course)
		end

		courses << new_course
		new_course.students << self
	end

	def course_load
		course_load = Hash.new(0)
		@courses.each { |course| course_load[course.department] += course.credits}
		course_load
	end
end
