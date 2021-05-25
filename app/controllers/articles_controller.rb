class ArticlesController < ApplicationController

  def index
    @articles = Article.page params[:page]
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  def search
    if params[:search].blank?
      redirect_to root_path
    else
      @parameter = params[:search].downcase
      @articles = Article.all.where("lower(body) LIKE :search OR lower(title) LIKE :search", search: "%#{@parameter}%")
    end
  end


  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end