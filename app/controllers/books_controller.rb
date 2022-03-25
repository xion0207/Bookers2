class BooksController < ApplicationController



  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    @books = Book.all
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @bookk = Book.new
    @user = @book.user
    @userr = User.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @edit = @book.user
    if @edit != current_user
    redirect_to user_path(current_user.id)
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
    flash[:notice] = "successfully"
    redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
