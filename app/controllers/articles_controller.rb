class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy]

	def index
		if params[:tag]
			@articles = Article.tagged_with(params[:tag])
		else
			@articles = Article.all.order("created_at DESC")
		end
	end

	def show
		
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		redirect_to root_path
	end

	private

	def find_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :content, :image, :remote_image_url, :tag_list)
	end

end
