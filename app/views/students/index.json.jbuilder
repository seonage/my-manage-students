json.array!(@students) do |student|
  json.extract! student, :name, :address, :state, :country, :phone, :email
  json.url student_url(student, format: :json)
end