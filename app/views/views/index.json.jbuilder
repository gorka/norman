json.array! @views do |view|
  json.extract! view, :date, :rating, :created_at
  json.viewable do
    json.tmdb_id view.viewable.tmdb_id
    json.title view.viewable.title
  end
  json.comment view.comment.body
end
