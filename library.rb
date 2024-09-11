require 'pry-byebug'

class Library 
	attr_accessor  :title,:name,:author
	def initialize
		@book = []
		@borrow = []
		@password = 1234
	end

	def add_book(title,author,name,password)
		if @password == password
			add_book = {  title: title,
				            author: author,
				            name: name,
				            availability: [true]
			           }
			@book << add_book
			puts "Book added successfully" 
			puts add_book 
		else	
			puts "Wrong password" 					
			puts "===============" 
		end	          
	end

	def remove(title,password)
		# binding.pry	
		remove_book = find_book(title)
		if  @password == password
			if remove_book && remove_book[:title] == title
				puts "#{remove_book[:title]} is removed from collections"
			  remove_book.clear
			  puts "Books removed successfully"
			  puts "=============================="
			else
				puts "Books is not available"
				puts "===========================" 
			end
		else
			puts "you enter the wrong password"
			puts "================================="
		end	
	end

	

	def return(title,password)
  	book = find_borrow(title)
	  if @password == password
			 if book && book[:title] == title
			  @book << book
			  @borrow.delete(book)
			  puts "book is return"
			  puts "===================================="
			 else
			 	puts "#{title} this book is not available"
			 	puts "====================================="
			 end
		else
			puts "Wrong password"
		end
	end

	def borrow(title,password)
		find = find_book(title)
		if @password == password
				if find && find[:title] == title
					@borrow << find
					@book.delete(find)
					puts "#{title} is borrowed"
					puts "========================"
				else
					puts "Books is not available"
					puts "========================"
				end
		else
			puts "Wrong password"
			puts '=================='
		end
	end

	def search(password)
		if @password == password 
			puts "select the options to search the books"
			puts " 1.title \n 2.author \n 3.name"
			puts "enter the number"
			num = gets.chomp.to_i

			case num 
				when 1
					puts "Enter the title of the book"
					title = gets.chomp.to_s
	       	find = find_book(title)
		      if find && find[:title] == title
		       	search_title(title)
		      else
		       	puts "book is not available"
		       	puts "====================="
		      end

	     when 2
		      puts "Enter the author's name"
		      author = gets.chomp.to_s
	        find = find_author(author)
	      if find && find[:author] == author
	      	search_author(author)
	      else
	      	puts "book is not available"
	      	puts "========================="
	      end

	     when 3
		    	puts "Enter the name "
		    	name = gets.chomp.to_s
		     	find = find_name(name)
	      if find && find[:name] == name
	      	search_name(name)
	      else
	      	puts "book is not available"
	      	puts "======================"
	      end
		    else
		    	puts "Enter valid number"
		    	puts "===================="
		    end
		else
			puts "You entered the wrong password"
			puts "=============================="
		end
 end

	def search_title(title)
		find = find_book(title)
		puts find
		puts "========================"
	end

	def search_author(author)
		find = find_author(author)
		puts find
		puts "======================="
	end

	def search_name(name)
		find = find_name(name)
		puts find
		puts "========================="
	end

	def display_available
		puts @book
		puts "These books are available"
		puts "=========================================="
	end

	def borrowed_books	
	  # binding.pry	
		puts @borrow
		puts "above are the list of all borrowed books"
		puts "=========================================="
	end

	def find_borrow(title)
		@borrow.find {|book| book[:title] == title}
	end

	def find_book(title)
		@book.find {|book| book[:title] == title}
	end

	def find_author(author)
		@book.find {|book| book[:author] == author}
	end

	def find_name(name)
		@book.find {|book| book[:name]  == name}
	end
end

library = Library.new

loop do
	puts " 1.Add book \n 2.Remove book \n 3.Borrow book \n 4.Return book \n 5.Search book \n 6.Available display books \n 7.Available borror books \n 8.Exit"
	
	puts "Enter the number"
	num = gets.chomp.to_i

 case num
	when 1
		puts "you enter 1 means you want to add book"
		puts "-----------------------------------------"
		puts "Enter the book's name"
		title = gets.chomp.to_s
		puts "Enter the name of author"
		author = gets.chomp.to_s
		puts "Enter the name"
		name = gets.chomp.to_s
		puts "Enter the password"
		password = gets.chomp.to_i
		library.add_book(title,author,name,password)
	when 2
		puts "You enter 2 means you want to remove the book"
		puts "-----------------------------------------------"
		puts "Enter the title of book"
		title = gets.chomp.to_s
		puts "Enter the password"
		password = gets.chomp.to_i
		library.remove(title,password)
	when 3
		puts "You Enter 3 which means you want to borrow book"
		puts "------------------------------------------------"
		puts "enter the tile of book which you want to borrow"
		title = gets.chomp.to_s
		puts "Enter the password"
		password = gets.chomp.to_i
		library.borrow(title,password)
	when 4
		puts "You enter 4 which means you want to return book"
		puts "------------------------------------------------"
		puts "Enter the title of the book which you want to return"
		title = gets.chomp.to_s
		puts "Enter the password"
		password = gets.chomp.to_i
		library.return(title,password)
	when 5
		puts "You enter the 5 which means you want to search the book"
		puts "--------------------------------------------------------"
		puts "Enter the password to search the books"
		password = gets.chomp.to_i
		library.search(password)
	when 6
		puts "you enter the 6 means you want to see all available books"
		puts "----------------------------------------------------------"
		library.display_available
	when 7 
		puts "You enter the 7 means you want to see all borrowed books"
		puts "---------------------------------------------------------"
		library.borrowed_books

	when 8	
		break
	else
		puts "please Enter valid number"
	end

end