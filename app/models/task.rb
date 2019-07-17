class Task < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :project }
end
