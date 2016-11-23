ActiveAdmin.register PageContentManagement do
  config.sort_order = 'updated_at_desc'

  menu parent: 'CMS', priority: 10, if: proc{ (current_admin_user.has_permission('cms_read') || current_admin_user.has_permission('cms_write') || current_admin_user.has_permission('cms_delete'))}

  permit_params :page_url, :page_section, :content, :active, :bootsy_image_gallery_id

  actions :all, except: [:new, :destroy]

  config.filters =   false
  action_item :back, only: :show do
    link_to "Back", admin_page_content_managements_path, method: :get
  end
  

  controller do 
  
   def action_methods
      super
      if current_admin_user.role == 'super_admin'
        super
      else
        disallowed = []
        disallowed << 'index' if (!current_admin_user.has_permission('cms_read') && !current_admin_user.has_permission('cms_write') && !current_admin_user.has_permission('cms_delete'))
        disallowed << 'show' if (!current_admin_user.has_permission('cms_read') && !current_admin_user.has_permission('cms_write') && !current_admin_user.has_permission('cms_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('cms_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('cms_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('cms_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('cms_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('cms_delete'))
        super - disallowed
      end
    end

	def index
		@pages = PageContentManagement.order(:page_url).group(:page_url)
		render 'index', :layout => 'active_admin'
	end
	
	def edit_page_content
	
		#abort(params.to_json)
	
		@pages = PageContentManagement.where('page_url = ? ', params[:page_url]).order(:page_section)
		
		@page_section = {}
		
		@pages.each do |page| 
			@page_section[page[:page_section]] = page[:id]
		end
				
		#abort(@page_section.to_json)
		#abort(@pages.to_json)
		render 'edit_page_content', :layout => 'active_admin'
	end
	
	def save_page_content
	
		
	
		page_id = params[:pageContent][:page_section]
		content_data = params[:pageContent][:content][page_id]
		#abort(params[:pageContent][:content][page_id])
		#abort(params.to_json)
	
		@pages = PageContentManagement.where('page_url = ? ', params[:page_url]).order(:page_section)
		
		@page_section = {}
		
		@pages.each do |page| 
			@page_section[page[:page_section]] = page[:id]
		end
		
		page_content = PageContentManagement.find_by(id: page_id)
		
		if page_content
		
			if page_content.update(content: content_data)
					
				flash[:notice] = "Page content successfully updated."
				redirect_to '/admin/edit_page_content?page_url=' + params[:page_url]
			else
				
				if page_content.errors.messages[:content][0]
					flash[:error] = 'Content ' + page_content.errors.messages[:content][0]
				else
					flash[:error] = "An error occurred !"
				end
			
				render 'edit_page_content', :layout => 'active_admin'
			end
		
		else
			flash[:error] = "Please select page section !"
			render 'edit_page_content', :layout => 'active_admin'
		end

	end
        
  end
  

end
