class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def new
        @book = Book.new
        @authors = Author.all
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to book_path(@book)
        else
            flash[:error] = @book.errors.full_messages
            @authors = Author.all
            render :new
        end
    end

    def show
        @book = Book.find(params[:id])
        @authors = Author.all
        @author_book = AuthorBook.new
    end

    # def update
    #     @book = Book.find(params[:id])
    #     if @book.update(book_params)
    #         redirect_to book_path(@book)
    #     else
    #         flash[:error] = @book.errors.full_messages
    #         @authors = Author.all
    #         render :edit
    #     end
    # end

    private

    def book_params
        params.require(:book).permit(:title, :pages, author_ids: [])
    end
end