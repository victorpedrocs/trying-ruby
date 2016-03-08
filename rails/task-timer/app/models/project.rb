class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true

  def get_total_time_spent
    total = 0

    tasks = self.tasks.includes(:timers).where.not(timers: { finish: nil } )
    tasks.each do |task|
      task.timers.each do |timer|
        total += timer.finish - timer.start
      end
    end

    return total.seconds

  end
end
