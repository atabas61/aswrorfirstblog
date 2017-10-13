class Page < ApplicationRecord
    
    mount_uploader :image, CoverUploader
    before_save :add_slug
    
     def durum
        if status==true
            '<div style="color:green; font-size:25px; line-height:20px;">•</div>'.html_safe
        else
            '<div style="color:red; font-size:25px; line-height:20px;">•</div>'.html_safe
        end
    end
    
    
    
    
    def ust_sayfa
        if parent==0 || !parent
            "Yok"
        else
            parentPage = Page.find(parent)
            parentPage.title
        end
    end
    
    
    
    private def add_slug
        self.slug = self.title.parameterize
    end
    
    def seo_title
        if slug.blank?
            "asw"
        else
            slug
        end
    end
end
