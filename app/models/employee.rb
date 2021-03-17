class Employee < ApplicationRecord

    has_many :absences, dependent: :destroy
    
    validates :firstName, presence: true

end
