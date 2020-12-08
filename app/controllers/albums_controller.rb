class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end
 
  def show
    @album = Album.find(params[:id])
    @album_attachments = @album.album_attachments.all
  end
 
  def new
    @album = Album.new
    @album_attachment = @album.album_attachments.build
  end
 
  def edit
    @album = Album.find(params[:id])
  end
 
  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        params[:album_attachments]['avatar'].each do |a|
          @album_attachment = @album.album_attachments.create!(:avatar => a,     :album_id => @album.id)
        end
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
 
  def update
    @album = Album.find(params[:id])
 
    if @album.update(album_params)
      redirect_to @album
    else
      render 'edit'
    end
  end
 
  def destroy
    @album = Album.find(params[:id])
    @album.destroy
 
    redirect_to albums_path
  end
 
  private
    def album_params
      params.require(:album).permit(:name, :description, album_attachments_attributes: 
        [:id, :album_id, :avatar])
    end
end
