class Category < ApplicationRecord
    has_many :post
    before_save :add_slug
    
    
    
    def durum
        if status==true
            "Aktif"
        else
            "Pasif"
        end
    end
    
    def ust_kategori
        if !parent || parent==0
            "Yok"
        else
            kategori = Category.find(parent)
            kategori.title
        end
    end
    
    
    private def add_slug
        self.slug = self.title.parameterize
    end
    
    
    
end



