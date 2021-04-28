class Absence < ApplicationRecord

  belongs_to :employee
    #attempt to upload/download cvs format files - this is in development
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Absence.create! row.to_hash
        end
    end
    
    #check valid data has been entered
    validates :date, presence: true
    validates :end_date, presence: true
    validates :instance_no, presence: true
    validate :full_or_half_pay
    
    #for sick cert
    mount_uploader :image, ImageUploader
    
    #attempt to upload/download cvs format files - this is in development
    def self.to_csv
        CSV.generate do |csv|
            csv << column_names
            all.each do |absence|
                csv << absence.attributes.values_at(*column_names)
            end
        end
    end
    
    private
     
    #bespoke validation to only allow half or full pay, not both (but at least one)   
    def full_or_half_pay
        unless full_pay.blank? ^ half_pay.blank?
            errors.add(:base, "Add only full or half days per absence. Add a new absence with the same instance number.")
        end
    end

end