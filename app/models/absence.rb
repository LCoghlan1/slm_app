class Absence < ApplicationRecord

  belongs_to :employee, optional: true
    
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Absence.create! row.to_hash
        end
    end
    
    validates :instance_no, presence: true
    validate :full_or_half_pay
    
    mount_uploader :image, ImageUploader
    
    def self.to_csv
        CSV.generate do |csv|
            csv << column_names
            all.each do |absence|
                csv << absence.attributes.values_at(*column_names)
            end
        end
    end
    
    private
        
        def full_or_half_pay
            unless full_pay.blank? ^ half_pay.blank?
                errors.add(:base, "Add only full or half days per absence. Add a new absence with the same instance number.")
            end
        end

end