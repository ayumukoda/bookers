class BooksController < ApplicationController

  def index
      @Books = Book.all
  end
  
  def create
      book = Book.new(book_params)
      if book.save
        flash[:notice] = "Book was successfully created."
        redirect_to books_index_path
      else
        flash[:notice] = "Book wasn't successfuiiy created"
        render :new
      end
  end
  
  def show
    @Book = Book.find(params[:id])
  end

  def edit
    @Book = Book.find(params[:id])
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