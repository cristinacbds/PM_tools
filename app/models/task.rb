class Task < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :project }
    belongs_to :project
end
