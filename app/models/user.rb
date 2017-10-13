class User < ApplicationRecord
    has_many :post
    has_many :comment
    
    validates :username, presence:true, length:{minimum:3, maximum:16}, uniqueness:true
    validates :password, presence:true, length:{minimum:6, maximum:30}, :on => [:create, :change_password]
    validates :full_name, presence:true
    validates :email, presence:true, uniqueness:true
    
    
    before_save :md5_password
    
    
    def md5_password
        self.password = Digest::MD5.hexdigest(self.password)
    end
    
    
    def group_name
        $user_groups[status]
    end
end
