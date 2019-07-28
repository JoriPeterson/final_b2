class Course < ApplicationRecord
	has_many :student_courses
	has_many :students, through: :student_courses

	validates_presence_of :name

	def student_grades
		# binding.pry
		students.select("students.*, student_courses.grade").order("student_courses.grade desc")
	end
end
