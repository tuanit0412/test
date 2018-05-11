class CommentsController < ApplicationController
	 http_basic_authenticate_with name: "tuan", password: "tuan", only: :destroy
	def create
		@article = Article.find(params[:article_id])
    		@comment = @article.comments.create(comment_params)
    		redirect_to article_path(@article)
		#We use the create method on @article.comments to create
		# and save the comment
	end

	def destroy
		@article=Article.find(params[:article_id]) #tim theo id bai viet
		@comment=@article.comments.find(params[:id]) #tim theo id comment
		#trong bai viet
		@comment.destroy #xoa
		redirect_to article_path(@article) #tra ve bai viet
		#The destroy action will find the article we are looking at, locate 
		#the comment within the @article.comments collection, and then
		# remove it from the database and send us back to the show action
		# for the article.
	end

	private
    		def comment_params
      			params.require(:comment).permit(:commenter, :body)
    		end
end
