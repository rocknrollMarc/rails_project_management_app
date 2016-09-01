require 'rails_helper'

RSpec.describe Task do

	it_should_behave_like "sizeable"

	it 'can distinguish a complete task' do
		task = Task.new
		expect(task).not_to be_complete
		task.mark_completed
		expect(task).to be_complete
	end

	describe 'Velocity' do
		
		let(:task) { Task.new(size: 3) }

		it 'does not count an incomplete task toward velocity' do
			expect(task).not_to be_part_of_velocity
			expect(task.points_toward_velocity).to eq(0)
		end

		it 'does not count a long-ago task toward velocity' do
			task.mark_completed(6.months.ago)
			expect(task).not_to be_part_of_velocity
			expect(task.points_toward_velocity).to eq(0)
		end
	end
end
