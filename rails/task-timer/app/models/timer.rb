class Timer < ActiveRecord::Base
  scope :recent, ->(num=10) { order(created_at: :desc).limit num }
  scope :by_task, ->(task) { where(task_id: task) }
  scope :open, -> { where(finish: nil) }
  scope :closed, -> { where.not(start: nil, finish: nil) }

  belongs_to :task
end
