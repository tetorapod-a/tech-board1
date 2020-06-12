json.array! @plans, partial: "plans/plan", as: :plan do |plan|
  json.title plan.name
end
