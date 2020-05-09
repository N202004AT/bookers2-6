class FavoritesController < ApplicationController
	def create
		@book = Book.find(params[:book_id])
		favorite = current_user.favorites.build(book_id: params[:book_id])
		favorite.save
		# redirect_to request.referer
	end
	def destroy
		#ビューを呼び出す必要がある際、@を使用。
		#destory後、他のページ、アクションでリダイレクトするときはそのアクション内容が呼び出されるからいらない
		@book = Book.find(params[:book_id])
		favorite = Favorite.find_by(book_id: params[:book_id],user_id: current_user.id)
		favorite.destroy
		# redirect_to request.referer
	end
end
