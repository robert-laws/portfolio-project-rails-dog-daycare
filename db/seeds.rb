User.destroy_all

@user_1 = User.create(first_name: "Bob", last_name: "Cobb", email: "bobcobb@net.com", username: "bobcobb", password: "hello1")
@user_2 = User.create(first_name: "Hal", last_name: "Hope", email: "halhope@net.com", username: "halhope", password: "hello1")

@address_1 = Address.create(street_1: "123 Main St.", street_2: "", city: "Boston", state: "MA", zip_code: "12353", user: @user_1)
@address_2 = Address.create(street_1: "876 Park Ave.", street_2: "", city: "Cambridge", state: "MA", zip_code: "15342", user: @user_2)

@dog_1 = Dog.create(name: "Spike", breed: "German Shepard", age: 4, sex: "male", user: @user_1)
@dog_2 = Dog.create(name: "Rocky", breed: "Bulldog", age: 2, sex: "female", user: @user_2)
@dog_3 = Dog.create(name: "Rover", breed: "Beagle", age: 7, sex: "male", user: @user_1)