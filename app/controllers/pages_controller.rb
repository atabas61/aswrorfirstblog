class PagesController < ApplicationController
    
    def show
        @page = Page.where(status:true, id:params[:id]).take
        if !@page.present?
           # redirect_to root_path
            render :not_page
        end
    end
    
    def not_page
    end
    
end
