class Project < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validate :due_date, :due_date_grater_than_today?
    # has_many :tasks, dependent: :destroy

    def due_date_grater_than_today?
        if due_date < Date.today
            errors.add(:due_date, "must be after the today") 
        end
    end
end
