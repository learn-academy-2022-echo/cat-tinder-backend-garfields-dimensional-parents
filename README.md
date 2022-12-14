# Rails Set up
- $ rails new cat-tinder-backend -d postgresql -T
- $ cd cat-tinder-backend
- $ rails db:create
- $ bundle add rspec-rails
- $ rails generate rspec:install
- Add the remote from your GitHub classroom repository
- Create a default branch (main)
- Make an initial commit to the repository
- $ rails server
- $ rails generate resource Cat name:string age:integer enjoys:text image:text
- $ rails db:migrate

# Rails Seeds
```ruby
 cats = [{
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
```
 $ rails db:seed

# CORS

 $ bundle add rack-cors

- double check rack-cors is in your gemfile

- add cors.rb file to initializers
- add code to file 

```ruby
# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # <- change this to allow requests from any domain while in development.

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```

## Cloning a rails app
- $ git clone <`code-from-gitHub-repo`>
- $ cd into the cat tinder backend repo
- $ git checkout -b api-endpoints
- $ bundle
- $ rails help
- $ rails db:prepare
- $ gst or git status
- $ code .

- To get a list of rails commands - $ rails help

-  $ rails db:prepare
    - short cut to creating, migrating, and seeding a database
    - a combination of $ rails db:create, $ rails db:migrate, $ rails db:seed

- INDEX
  - As a developer, I can add an index request spec to my application.
    - Create a test in spec/requests/cats_spec.rb
    - Saw it fail

  - As a developer, I can add an index endpoint to my application.
    - Update the index controller
    - See it pass

- CREATE
  - As a developer, I can add a create request spec to my application.
    - Create a test in spec/requests/cats_spec.rb
    - Saw it fail

  - As a developer, I can add a create endpoint to my application.
    - Update the create controller
    - See it pass