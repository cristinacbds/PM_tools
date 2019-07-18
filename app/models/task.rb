class Task < ApplicationRecord
    validates :title, presence: true
    belongs_to :project
end
