class Admin::Menu < ApplicationRecord
    
    def durum
        if status==true
            '<span class="dotred">•</span>'
        else
            '<span class="dotgreen">•</span>'
        end
    end
    
    
    
    def hedef 
        if target=='_blank'
            "Yeni Pencereden"
        end
    end
    
end
