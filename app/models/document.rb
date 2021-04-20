class Document < ApplicationRecord

    mount_uploader :key, ImageUploader
    
end
