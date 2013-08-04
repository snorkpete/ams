json.array!(@announcements) do |announcement|
  json.extract! announcement, :description, :details, :status
  json.url announcement_url(announcement, format: :json)
end
