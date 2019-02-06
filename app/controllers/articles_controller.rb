# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  skip_before_action :verify_authenticity_token


  def new
    @article = Article.new
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5) 
     #if params[:search].present?
     #  search = params[:search].downcase
      # @articles = Article.where([("description LIKE?" || "title LIKE?"),"%#{params[:search].downcase!}%"])
     #end
  end

  def edit

  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = 'Article was Successfully Created'
      redirect_to @article
      #render json: { result: true, msg: @article}, status: :created
    else
      render 'new'
      #render json: {result: false, article: @article.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = 'Article was successfully deleted'
    redirect_to articles_path
  end

  def update
    if @article.update(article_params)
      flash[:success] = 'Article was successfully updated'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show

  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user and !current_user.adimin?
      flash[:danger] = "You can only edit or delete your own articles"
      redirect_to root_path
    end
  end
end

