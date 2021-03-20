class Absence < ApplicationRecord
  
  belongs_to :employee, optional: true
    
    validates :instance_no, presence: true
    validate :full_or_half_pay
    
    mount_uploader :image, ImageUploader
    
    private
        
        def full_or_half_pay
            unless full_pay.blank? ^ half_pay.blank?
                errors.add(:base, "Add only full or half days per absence. Add a new absence with the same instance number.")
            end
        end

end