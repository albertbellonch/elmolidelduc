class Admin::ImagesController < Admin::AdminController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def edit
    @image = Image.find params[:id]
  end

  def create
    @image = Image.new params[:image]

    if @image.save
      redirect_to admin_root_path, :notice => "Nova imatge creada"
    else
      flash[:alert] = "Error en crear la imatge"
      render :action => :new
    end
  end

  def update
    @image = Image.find params[:id]

    if @image.update_attributes params[:image]
      redirect_to admin_root_path, :notice => "Imatge actualitzada"
    else
      flash[:alert] = "Error en modificar la imatge"
      render :action => :new
    end
  end

  def destroy
    @image = Image.find params[:id]
    @image.destroy
    redirect_to admin_root_path
  end
end
