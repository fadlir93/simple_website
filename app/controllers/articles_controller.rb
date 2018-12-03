# frozen_string_literal: true

class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
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
    @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = 'Article was successfully deleted'
    redirect_to articles_path
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = 'Article was successfully updated'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show
    @article1 = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
