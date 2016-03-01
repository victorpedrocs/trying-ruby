class Task < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :destroy
  has_many :timers, dependent: :destroy

  validates :name, presence: true
  validates :description, length: { maximum: 500 }
  validates :project_id, presence: true

  def closed_timers
    self.timers.where.not(finish: nil)
  end

  def last_open_timer
    self.timers.where(finish: nil).last
  end
end
