class Document < ApplicationRecord

    #support file upload
    has_one_attached :file
    validates :name, presence: true
    
end
