User.destroy_all
Location.destroy_all
Activity.destroy_all

@user_1 = User.create(first_name: "Bob", last_name: "Cobb", email: "bobcobb@net.com", username: "bobcobb", password: "hello1")
@user_2 = User.create(first_name: "Hal", last_name: "Hope", email: "halhope@net.com", username: "halhope", password: "hello1")

@address_1 = Address.create(street_1: "123 Main St.", street_2: "", city: "Boston", state: "MA", zip_code: "12353", user: @user_1)
@address_2 = Address.create(street_1: "876 Park Ave.", street_2: "", city: "Cambridge", state: "MA", zip_code: "15342", user: @user_2)

@dog_1 = Dog.create(name: "Spike", breed: "German Shepard", age: 4, sex: "male", user: @user_1)
@dog_2 = Dog.create(name: "Rocky", breed: "Bulldog", age: 2, sex: "female", user: @user_2)
@dog_3 = Dog.create(name: "Rover", breed: "Beagle", age: 7, sex: "male", user: @user_1)



@location_1 = Location.create(name: "Dog Town", open_year: 2014, capacity: 30, size: 2500, city: "Detroit")
@location_2 = Location.create(name: "Daycare and Spa for Dogs", open_year: 2018, capacity: 20, size: 2050, city: "Chicago")
@location_3 = Location.create(name: "Your Dog Place", open_year: 2007, capacity: 34, size: 3250, city: "Milwalkee")
@location_4 = Location.create(name: "Happy Pups", open_year: 2003, capacity: 16, size: 1600, city: "Cleveland")

@activity_1 = Activity.create(name: "Fetch the Stick", description: "Sticks are thrown far and dogs run to retrieve them", best_for_type: "energetic", best_for_size: "big", energy_usage: "high")
@activity_2 = Activity.create(name: "Solve the Puzzle", description: "Treats are available for the dog that can solve the puzzle", best_for_type: "smart", best_for_size: "medium", energy_usage: "low")
@activity_3 = Activity.create(name: "Obstacle Course", description: "Dogs run through, over, and around a bunch of different obstacles", best_for_type: "agile", best_for_size: "medium", energy_usage: "high")
@activity_4 = Activity.create(name: "Indoors Ball Bounce", description: "A bouncy ball is thrown indoors for the dog to chase and catch", best_for_type: "energetic", best_for_size: "small", energy_usage: "high")


activity_group = [@activity_1, @activity_2, @activity_3, @activity_4]

activity_group.each_with_index do |val, index|
  if index.odd?
    @location_1.activities << val
  end
end

activity_group.each_with_index do |val, index|
  if index.even?
    @location_2.activities << val
  end
end

activity_group.each do |val|
  @location_3.activities << val
end

@location_4.activities << @activity_4