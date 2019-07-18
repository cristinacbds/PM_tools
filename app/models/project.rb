class Project < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    has_many :tasks
end
