class FileManagementsController < ApplicationController
  def index
    @image_urls = FileManage.all.collect{ |f|
      {
          src:f.avatar.url,
          title: ''
      }
    }
  end

  def show

  end

  def new
    @file = FileManage.new()
  end

  def create
    @file = FileManage.new()
    @file.avatar = params[:file_manage][:avatar] if params[:file_manage].present?
    @file.save
  end

  private
  def file_manage_params
    params.require(:file_manage).permit(:avatar)
  end
end
