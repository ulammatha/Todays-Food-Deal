ThinkingSphinx::Index.define :deal, with: :active_record do
  indexes recipe_name
  indexes eatery.eatery_name   as: :eatery_name
end