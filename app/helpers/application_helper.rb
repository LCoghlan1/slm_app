module ApplicationHelper
    
    include Pagy::Frontend
    
    def bool_to_glyph(value)
      value ? "Yes" : "No"
    end
    
    def four_year_look_back(value)
      
    end
      
    
end
