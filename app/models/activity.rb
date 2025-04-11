class Activity < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :action_type, presence: true

  def status_change_data
    return nil unless action_type == "status_change"
    data
  end

  def comment_data
    return nil unless action_type == "comment"
    data
  end
end
