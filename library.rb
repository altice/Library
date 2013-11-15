class Library
  def initialize
    @books = []
    

  end

  def books
    @books
  end

  def list_books
    @books.each{|book| puts "The name of the book is #{book.title} and it is #{book.status}"}
  end

  def borrowed_books
    @books.each{|book| puts book.title if book.status == "available" }
  end

  def available_books
    @books.each{|book| puts book.title if book.status == "unavailable" }
  end

  def add_book(book)
    @books << book
  end

  def check_out(user, book)
    if user.borrowed_books_count >= 2
      puts "Sorry, you have already exceeded the count"
      return
    end

    if book.status == "available"
      book.status = "unavailable"
      book.borrower = user
      user.books << book
      puts "#{book.title} has been checked out by #{user.name}"
    else
       puts "Sorry the book is checked out"
    end
  end

  def check_in(book)
   # book.status="available"
  end
end

class Borrower
 
  attr_accessor :books, :name 
  def initialize(name)
    @name = name
    @books = []
  end

  def borrowed_books
    @books
  end

  def borrowed_books_count
    borrowed_books.length
  end

  def borrowed_books_list
    @books.each do |book|
      puts book.title
    end
  end
end

class Book
  attr_accessor :status, :borrower
  def initialize(title, author)
    @title = title
    @author = author
    @status = "available"
    @borrower = nil

  end

  def title
    @title
  end

    # def status
    #   @status
    # end
end
