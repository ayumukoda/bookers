class BooksController < ApplicationController

  def index
      @books = Book.all
      @book = Book.new
  end
  
  def create
      @book = Book.new(book_params)
      if @book.save
        flash[:notice] = "Book was successfully created."
        redirect_to books_index_path
      else
        @books = Book.all
        flash[:notice] = "Book wasn't successfuiiy created"
        render :index
      end
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book_params)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books/index'
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end

end