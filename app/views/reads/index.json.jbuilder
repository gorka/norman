json.array! @reads do |read|
  json.extract! read, :date, :rating, :created_at
  json.book do
    json.extract! read.book, :title, :subtitle, :isbn, :author, :web, :description
  end
end
