require 'rails_helper'

RSpec.describe StudentCourse do
	describe 'Validations' do
		it { should validate_presence_of :grade }
	end

	describe 'Relationships' do
		it { should belong_to :student }
		it { should belong_to :course }
	end
end
