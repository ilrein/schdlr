json.array!(@companies) do |company|
  json.extract! company, :id, :index, :show, :edit, :update, :create, :destroy
  json.url company_url(company, format: :json)
end
