class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    photo_in = params[:id]
    @photo = Photo.find(params["id"])
  end

  def destroy
    photo_in = params[:id]
    Photo.destroy(photo_in)
    redirect_to("http://localhost:3000/photos")
  end

  def new_form
    render("new_form.html.erb")
  end

  def create_row
    caption = params[:the_caption]
    source = params[:the_source]
    p = Photo.new
    p.source = source
    p.caption = caption
    p.save
    redirect_to("http://localhost:3000/photos")
  end

  def edit_form
    photo_in = params[:id]
    @photo = Photo.find(params["id"])
    render("edit.html.erb")
  end

  def update_row
    new_caption = params[:the_caption]
    new_source = params[:the_source]
    p = Photo.find(params["id"])

    @changes =
      if p.caption != new_caption && p.source != new_source
        "You have changed the caption from " + p.caption + " to " + new_caption + " and the source from " + p.source + " to " + new_source + "."
      elsif p.caption != new_caption
        "You have changed the caption from " + p.caption + " to " + new_caption + "."
      elsif p.source != new_source
        "You have changed the source from " + p.source + " to " + new_source + "."
      else
        "You have made no changes."
      end

    p.source = new_source
    p.caption = new_caption
    p.save

    @photo = p

    render("edited.html.erb")
  end

end
