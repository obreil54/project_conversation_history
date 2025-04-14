class Activity < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :action_type, presence: true

  after_create :broadcast_activity

  def status_change_data
    return nil unless action_type == "status_change"
    data
  end

  def comment_data
    return nil unless action_type == "comment"
    data
  end

  def broadcast_activity
    broadcast_prepend_to(
      [ project, "activities" ],
      target: "activity-feed",
      partial: "activities/activity",
      locals: { activity: self }
    )
  end
end
