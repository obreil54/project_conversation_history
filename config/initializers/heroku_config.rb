if ENV["HEROKU_APP_NAME"].present? || ENV["DYNO"].present?
  Rails.application.config.active_job.queue_adapter = :async
end
