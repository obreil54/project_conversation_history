class Project < ApplicationRecord
  enum :status, {
    not_started: 0,
    in_progress: 1,
    on_hold: 2,
    completed: 3,
    cancelled: 4
  }

  validates :name, :description, :status, presence: true

  has_many :activities, dependent: :destroy

  before_update :log_status_change, if: :status_changed?

  def status_color_class
    {
      "not_started" => "bg-gray-100 text-gray-800",
      "in_progress" => "bg-blue-100 text-blue-800",
      "on_hold" => "bg-yellow-100 text-yellow-800",
      "completed" => "bg-green-100 text-green-800",
      "cancelled" => "bg-red-100 text-red-800"
    }[status]
  end

  def add_comment(comment)
    activities.create(
      user: Current.user,
      action_type: "comment",
      data: { comment: comment }
    )
  end

  private

  def log_status_change
    activities.create(
      user: Current.user,
      action_type: "status_change",
      data: {
        from: status_was,
        to: status
      }
    )
  end
end
