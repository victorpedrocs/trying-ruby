class Comment < ActiveRecord::Base
  belongs_to :task

  validates :author, presence: true
end
