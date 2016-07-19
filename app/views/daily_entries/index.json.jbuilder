json.array!(@daily_entries) do |daily_entry|
  json.extract! daily_entry, :id, :did_yesterday, :doing_today, :problems, :posted_on
  json.url daily_entry_url(daily_entry, format: :json)
end
