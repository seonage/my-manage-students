json.array!(@messages) do |message|
  json.extract! message, :student_id, :title, :content
  json.url message_url(message, format: :json)
end