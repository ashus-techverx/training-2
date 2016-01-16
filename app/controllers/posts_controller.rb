class PostsController < ApplicationController

	before_action :authenticate_user!

	def index
		
		@posts = Post.all.order('created_at DESC')
	end
	def new
		@post = Post.new 
	end

	def create


		@post = Post.new(post_params)
		
		if (@post.save)

			
			puts"ssssssssssssssssssssssssssssssssssss---ewee",@post.title.inspect
			
		# Validates the post and redirects accordingly


		redirect_to @post

	else
		render 'new'

	end

end

def show
	@post = Post.find(params[:id])
	
	
end

def edit
	@post = Post.find(params[:id])
end

def update
	@post = Post.find(params[:id])

	if @post.update(params[:post].permit(:title, :body))
		redirect_to @post
	else
		render 'edit'
	end
end

def destroy
	@post = Post.find(params[:id])
	@post.destroy
	redirect_to posts_path
end

def search

	#byebug
	@posts = Post.where("title = ? " , "#{params[:search]}" )
     #@posts = Post.find_by_sql(["SELECT id FROM posts WHERE title = ? ", "%#{params[:search]}%" ]).first
	#@posts = Post.find(:all, :conditions =>['title LIKE ?', "%#{params[:search]}%"]) 
	#@posts = Post.find(:all)
	#redirect_to posts_search_path
	
end




private


def post_params
	params.require(:post).permit(:title, :body)
end


end
