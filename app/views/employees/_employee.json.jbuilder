json.extract! employee, :id, :firstName, :lastName, :location, :workHours, :created_at, :updated_at
json.url employee_url(employee, format: :json)
