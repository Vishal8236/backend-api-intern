# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(
    username: "1412", 
    password: "142487", 
    token: "xjwz6zgo7wjuxfgfhuex96u924e9638xnzy2sikp1yigyf6oq8u5i7v8pz0dpny9xtyhx71rrj8flbv7p8z2lomyxum1pbup057awz91d9cg0owsorvi9pufhc9l7pldyb9sa0on44mql1k0cp0eum",
    login_id: 1,
    last_login: DateTime.now
)