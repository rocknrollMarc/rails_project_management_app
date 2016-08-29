# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  project_id   :integer
#  title        :string(255)
#  size         :integer
#  completed_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_tasks_on_project_id  (project_id)
#

class Task < ActiveRecord::Base

  belongs_to :project

  def mark_completed(date = nil)
    self.completed_at = (date || Time.current)
  end

  def complete?
    completed_at.present?
  end

  def part_of_velocity?
    return false unless complete?
    completed_at > Project.velocity_length_in_days.days.ago
  end


  def points_toward_velocity
    if part_of_velocity? then size else 0 end
  end

end

