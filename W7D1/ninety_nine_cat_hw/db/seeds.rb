# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Cat.destroy_all

Cat.create(birth_date: "03/03/2002", color: "black", name: "bob", sex: "M", description: "gjnkskj")
Cat.create(birth_date: "04/04/2015", color: "white", name: "mittens", sex: "F", description: "dfgh")
Cat.create(birth_date: "05/06/2022", color: "red", name: "marley", sex: "F", description: "jyr")
Cat.create(birth_date: "01/03/2021", color: "orange", name: "flippers", sex: "M", description: "hk")
Cat.create(birth_date: "12/06/2008", color: "white", name: "tod", sex: "M")
