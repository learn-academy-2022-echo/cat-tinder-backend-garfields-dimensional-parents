# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

cats = [
  {
    name: "Mosey",
    age: 7,
    enjoys: "showing up in places he is not expected",
    image: "https://people.com/thmb/TOWzG1I45R7tb-cnu8eQmLlW1go=/900x0/filters:no_upscale():max_bytes(150000):strip_icc():gifv():focal(659x344:661x346):format(webp)/Mostaccioli-01-831c65474751439d8f1b72eee9be76a5.jpg"
  }, 
  {
    name: "Kelly",
    age: 23,
    enjoys: "Aspiring souncloud artists",
    image: "https://ih1.redbubble.net/image.690761378.7456/flat,750x,075,f-pad,750x1000,f8f8f8.jpg"
  }, 
  {
    name: "Puss in Boots",
    age: 4,
    enjoys: "Tom cat things",
    image: "https://upload.wikimedia.org/wikipedia/commons/d/dc/Grumpy_Cat_%2814556024763%29_%28cropped%29.jpg"
  }, 
  {
    name: "Clawdia",
    age: 15,
    enjoys: "Shopping",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0B4qo_jSCNLYoEGOwWf_oJ5KcZc2MPz7a-Q&usqp=CAU"
  }, 
]

cats.each do |indiv_cat|
  Cat.create indiv_cat
  p "#{indiv_cat} was added to the database"
end

p "Database status and confirmation"
p Cat.all 