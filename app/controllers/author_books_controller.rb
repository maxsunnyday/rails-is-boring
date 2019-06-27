class AuthorBooksController < ApplicationController
    def create
        @author_book = AuthorBook.find_or_create_by(author_book_params)
        redirect_to book_path(@author_book.book)
    end

    def destroy
        @author_book = AuthorBook.find(params[:id])
        @author_book.destroy
        redirect_to books_path
    end

    private

    def author_book_params
        params.require(:author_book).permit(:author_id, :book_id)
    end
end