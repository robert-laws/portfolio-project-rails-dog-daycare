module DogsHelper
  def years_old(dog)
    "#{pluralize(dog.age, "year")} old"
  end
end
