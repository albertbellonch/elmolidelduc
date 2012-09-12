class Admin::PagesController < Admin::AdminController
  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
    @page.page_contents.build
  end

  def create
    @page = Page.new params[:page]

    if @page.save
      redirect_to admin_pages_url
    else
      render :action => :new
    end
  end

  def destroy
    @page = Page.find params[:id]
    @page.destroy
    redirect_to admin_pages_url
  end

  def edit
    @page = Page.find params[:id]
  end

  def update
    @page = Page.find params[:id]

    respond_to do |format|
      if @page.update_attributes params[:page]
        redirect_to admin_pages_url
      else
        render :action => :edit
      end
    end
  end
end

