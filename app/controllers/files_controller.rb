require 'fileutils'
require 'iconv'

class FilesController < ApplicationController
  before_filter :require_existing_file, :only => [:show, :edit, :update, :destroy]
  before_filter :require_existing_target_folder, :only => [:new, :create]

  before_filter :require_create_permission, :only => [:new, :create]
  before_filter :require_read_permission, :only => :show
  before_filter :require_update_permission, :only => [:edit, :update]
  before_filter :require_delete_permission, :only => :destroy

  # @file and @folder are set in require_existing_file
  def show
    send_file @file.attachment.path, :filename => @file.attachment_file_name
  end

  # @target_folder is set in require_existing_target_folder
  def new
    @file = @target_folder.user_files.build
    @file[:content] = '<h1>New file</h1>'
  end

  # @target_folder is set in require_existing_target_folder
  def create
  
  	data = params[:user_file]
    @file = @target_folder.user_files.build(data.except(:content))
    
    if @file.save
      
      if data[:content]
        File.open(@file.attachment.path, 'w') do |f|
          f.puts data[:content]
        end
      end  
      redirect_to folder_url(@target_folder)
    else
      render :action => 'new'
    end
	#end unless params[:user_file].nil?
    #redirect_to fredit_path(:file => @path)
  end

  # @file and @folder are set in require_existing_file
  def edit
  	Iconv.open('UTF-8//IGNORE', 'UTF-8') do |ic|
  	  @file[:content] = ic.iconv(File.open(@file.attachment.path, 'r').read)
  	end
  end

  # @file and @folder are set in require_existing_file
  def update
  	
  	data = params[:user_file]
  	 	
    if @file.update_attributes(data.except(:content))
    
      if data[:content]
        File.open(@file.attachment.path, 'w') do |f|
          f.puts data[:content]
        end
      end
      redirect_to edit_file_url(@file), :notice => t(:your_changes_were_saved)
    else
      render :action => 'edit'
    end
  end

  # @file and @folder are set in require_existing_file
  def destroy
    @file.destroy
    redirect_to folder_url(@folder)
  end

  private

  def require_existing_file
    @file = UserFile.find(params[:id])
    @folder = @file.folder
  rescue ActiveRecord::RecordNotFound
    redirect_to folder_url(Folder.root), :alert => t(:already_deleted, :type => t(:this_file))
  end
end
