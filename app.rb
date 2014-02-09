# $ ruby app.rb
require 'sinatra'

# mongo db connection
require 'mongo'
include Mongo
db = Connection.new.db('my_mongo_db')

books_db = db.collection('books')

# Add initial data
if books_db.count == 0
  book = { name: "Start-up Ruby", price: 2500 }
  books_db.insert(book) # save
end

# Getting all
# books.find.to_a

# Getting latest one
# books_db.find.sort( [['_id', -1]] ).limit(1).first # efficient
# books_db.find.to_a.last #readable

get '/books/array' do
  books_db.find.to_a.inspect
end

get '/books/latest' do
  books_db.find.sort( [['_id', -1]] ).limit(1).first.inspect
end
