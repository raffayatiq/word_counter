class BooksController < ApplicationController
	def create
		@book = Book.new(book_params)
		@book.project_id = params[:project_id]
		@book.file.attach(params[:book][:file])
		
		if @book.save
			@book.get_words
			redirect_to project_url(@book.project)
		else
			#ERROR AND REDIRECT
			render json: "ERROR"
		end

	end

	private
	def book_params
		params.require(:book).permit(:file)
	end

	def path_to_file
		filename = @book.file.blob.key
		file_folder = filename[0..1]
		file_sub_folder = filename[2..3]
		Rails.root.join('storage', file_folder, file_sub_folder, filename)
	end
end