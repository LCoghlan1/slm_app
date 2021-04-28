class Employee < ApplicationRecord

    #establish relationship
    has_many :absences, dependent: :destroy
    
    validates :firstName, presence: true
    validates :lastName, presence: true
    validates :location, presence: true
    validates :workHours, presence: true
    validates :entitlement, presence: true

end
