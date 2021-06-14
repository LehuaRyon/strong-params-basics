class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def edit
	  @post = Post.find(params[:id])
	end

	# def create
	#   @post = Post.new(params["post"])
	#   @post.save
	#   redirect_to post_path(@post)
	# end

	# def update
	#   @post = Post.find(params[:id])
	#   @post.update(params["post"])
	#   redirect_to post_path(@post)
	# end

	# def create
	# 	@post = Post.new(params.require(:post).permit(:title, :description))
	# 	@post.save
	# 	redirect_to post_path(@post)
	#   end
	  
	#   def update
	# 	@post = Post.find(params[:id])
	# 	@post.update(params.require(:post).permit(:title))
	# 	redirect_to post_path(@post)
	#   end 


	# def create
	# 	@post = Post.new(post_params)
	# 	@post.save
	# 	redirect_to post_path(@post)
	#   end
	  
	#   def update
	# 	@post = Post.find(params[:id])
	# 	@post.update(post_params)
	# 	redirect_to post_path(@post)
	#   end
	  
	#   private
	  
	#   def post_params
	# 	params.require(:post).permit(:title, :description)
	#   end 

	def create
		@post = Post.new(post_params(:title, :description))
		@post.save
		redirect_to post_path(@post)
	  end
	  
	  def update
		@post = Post.find(params[:id])
		@post.update(post_params(:title))
		redirect_to post_path(@post)
	  end
	  
	  private
	  
	  # Hm, but didn't we say above that we only wanted to permit updates to :title in the update action? We can make sure that we meet that requirement with a slightly fancy splat:
	  # We pass the permitted fields in as *args;
	  # this keeps `post_params` pretty dry while
	  # still allowing slightly different behavior
	  # depending on the controller action. This
	  # should come after the other methods
	  
	  def post_params(*args)
		params.require(:post).permit(*args)
	  end 
end
