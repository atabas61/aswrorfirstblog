class Post < ApplicationRecord
    belongs_to :category
    belongs_to :user
    has_one :comment
    mount_uploader :image, CoverUploader
    before_save :add_slug
    
    
    
    
    def durum
        if status==true
            '<div style="color:green; font-size:25px; line-height:20px;">•</div>'.html_safe
        else
            '<div style="color:red; font-size:25px; line-height:20px;">•</div>'.html_safe
        end
    end
    
    
    def seo_title
        if slug.blank?
            "asw"
        else
            slug
        end
    end
    
    
    private def add_slug
        self.slug = self.title.parameterize
    end
    
end
