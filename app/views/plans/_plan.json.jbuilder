json.extract! plan, :id, :name, :start, :end, :place, :place_url, :client, :body1, :body2, :body3, :body4, :detail, :limit, :created_at, :updated_at
json.url plan_url(plan)
# json.id     @plans.ids
# json.start  @plans.start
# json.end    @plans.end
json.title plan.name
json.start plan.start
json.end plan.end
json.client plan.client

# json.name @plans.name

# json.array @plans do |plan|
#   json.name plan.name
#   json.title plan.name
# end
