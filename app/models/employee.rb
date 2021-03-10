class Employee < ApplicationRecord

    has_many :absences, dependent: :destroy

end
