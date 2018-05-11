class ArticlesController < ApplicationController
	 http_basic_authenticate_with name: "tuan", password: "tuan", except: [:index, :show]
 
  	def index
    		@articles = Article.all
  	end
	
	 #phuong thuc index phai co S =>articles
		#vi phuong thuc nay giong phuong thuc delete nhung delete thi
		#bien khong co S

	def new
		@article=Article.new	#The reason why we added 
		#@article = Article.new in the ArticlesController is that 
		#otherwise @article would be nil in our view, and 
		#calling @article.errors.any? would throw an error.
	end

	def edit
		@article=Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
 
 		 if @article.update(article_params)
    			redirect_to @article
  		else
    			render 'edit'
  		end
  	end
		
	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'	
			#su dung ham if else... neu viec bat loi toi 
			#thieu 5 ky tu  title trong model tra ve false thi 
			#goi phuong thuc render lai
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def destroy
		@article=Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
