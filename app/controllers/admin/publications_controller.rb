class Admin::PublicationController < AdminController
  before_filter :find_publication, only:[:show, :edit, :update, :destroy]
  def index
    @publications = Publication.all
  end
  def show; end

  def new
    @publications = Publication.new
  end
  def create
    @publications =
    Publication.new (publication_params)

    if @publication.save
      redirect_to
      admin_publication_path(@publication)
    else
      render :edit, alert: "Something went wrong."
    end
  end

  private
  def find_publication
    @publication = Publication.find(param[:id])
  end

  def publication_params
    params.require(:publication).permit(:title,
    :description,
    :file_url)
  end
end
