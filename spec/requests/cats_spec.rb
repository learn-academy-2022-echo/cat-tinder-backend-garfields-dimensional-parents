require 'rails_helper'

RSpec.describe "Cats", type: :request do
  # index to see all the cats
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
        name: "Felicia",
        age: 4,
        enjoys: "borrowing VCRs and not returning them",
        image: "https://media.vanityfair.com/photos/5e27310def889c00087c7928/2:3/w_887,h_1331,c_limit/taylor-swift-cats.jpg"
      )

      # make a request
      get '/cats'

      # p response
      #<ActionDispatch::TestResponse:0x000000013470ed58 @mon_data=#<Monitor:0x000000013470eb78>, @mon_data_owner_object_id=24680, @header={"X-Frame-Options"=>"SAMEORIGIN", "X-XSS-Protection"=>"0", "X-Content-Type-Options"=>"nosniff", "X-Download-Options"=>"noopen", "X-Permitted-Cross-Domain-Policies"=>"none", "Referrer-Policy"=>"strict-origin-when-cross-origin", "Content-Type"=>"application/json; charset=utf-8", "ETag"=>"W/\"c19ebecc66fbd88ba76ff64cd5af931f\"", "Cache-Control"=>"max-age=0, private, must-revalidate", "X-Request-Id"=>"78e4996f-f3f6-4354-b4a7-ead6959a8fa1", "X-Runtime"=>"0.035353", "Vary"=>"Origin", "Content-Length"=>"282"}, @stream=#<ActionDispatch::Response::Buffer:0x000000013470e5d8 @response=#<ActionDispatch::TestResponse:0x000000013470ed58 ...>, @buf=["[{\"id\":5,\"name\":\"Felicia\",\"age\":4,\"enjoys\":\"borrowing VCRs and not returning them\",\"image\":\"https://media.vanityfair.com/photos/5e27310def889c00087c7928/2:3/w_887,h_1331,c_limit/taylor-swift-cats.jpg\",\"created_at\":\"2022-09-22T20:42:24.738Z\",\"updated_at\":\"2022-09-22T20:42:24.738Z\"}]"], @closed=false, @str_body=nil>, @status=200, @cv=#<MonitorMixin::ConditionVariable:0x000000013470e3f8 @monitor=#<Monitor:0x000000013470eb78>, @cond=#<Thread::ConditionVariable:0x000000013470e358>>, @committed=false, @sending=false, @sent=false, @cache_control={:max_age=>"0", :private=>true, :must_revalidate=>true}, @request=#<ActionDispatch::Request GET "http://www.example.com/cats" for 127.0.0.1>>
      cat = JSON.parse(response.body)
      # p cat
      # [{"id"=>5, "name"=>"Felicia", "age"=>4, "enjoys"=>"borrowing VCRs and not returning them", "image"=>"https://media.vanityfair.com/photos/5e27310def889c00087c7928/2:3/w_887,h_1331,c_limit/taylor-swift-cats.jpg", "created_at"=>"2022-09-22T20:42:24.738Z", "updated_at"=>"2022-09-22T20:42:24.738Z"}]
      expect(cat.length).to eq(1)
      expect(response.status).to eq(200)
    end  
  end

  # create a cat
  describe "POST /create" do
    it "creates a cat" do
      # params to send with the request
      cat_params = {
        cat: {
          name: "Felicia",
          age: 4,
          enjoys: "borrowing VCRs and not returning them",
          image: "https://media.vanityfair.com/photos/5e27310def889c00087c7928/2:3/w_887,h_1331,c_limit/taylor-swift-cats.jpg"
        }
      }

      # send request
      post '/cats', params: cat_params
      
      cat = Cat.first

      json = JSON.parse(response.body).deep_symbolize_keys
      p json
      # {:id=>8, :name=>"Felicia", :age=>4, :enjoys=>"borrowing VCRs and not returning them", :image=>"https://media.vanityfair.com/photos/5e27310def889c00087c7928/2:3/w_887,h_1331,c_limit/taylor-swift-cats.jpg", :created_at=>"2022-09-22T21:11:22.588Z", :updated_at=>"2022-09-22T21:11:22.588Z"}

      expect(response).to have_http_status(200)
      expect(Cat.count).to eq(1)
      expect(json[:enjoys]).to eq("borrowing VCRs and not returning them")
      expect(json[:age]).to eq(4)

    end
     it "can't create a cat without a name" do
      # params to send with the request
      cat_params = {
        cat: {
          age: 4,
          enjoys: "borrowing VCRs and not returning them",
          image: "https://media.vanityfair.com/photos/5e27310def889c00087c7928/2:3/w_887,h_1331,c_limit/taylor-swift-cats.jpg"
        }
      }

      # send request
      post '/cats', params: cat_params
      
      expect(response).to have_http_status(422)

      json = JSON.parse(response.body)
      p json
      expect(json['name']).to include "can't be blank"
    end
    it "can't create a cat without a age" do
      # params to send with the request
      cat_params = {
        cat: {
          name: "Felcia",
          enjoys: "borrowing VCRs and not returning them",
          image: "https://media.vanityfair.com/photos/5e27310def889c00087c7928/2:3/w_887,h_1331,c_limit/taylor-swift-cats.jpg"
        }
      }

      # send request
      post '/cats', params: cat_params
      
      expect(response).to have_http_status(422)

      json = JSON.parse(response.body)
      p json
      expect(json['age']).to include "can't be blank"
    end
    it "can't create a cat without a enjoys" do
      # params to send with the request
      cat_params = {
        cat: {
          name: "Felcia",
          age: 2,
          image: "https://media.vanityfair.com/photos/5e27310def889c00087c7928/2:3/w_887,h_1331,c_limit/taylor-swift-cats.jpg"
        }
      }

      # send request
      post '/cats', params: cat_params
      
      expect(response).to have_http_status(422)

      json = JSON.parse(response.body)
      p json
      expect(json['enjoys']).to include "can't be blank"
    end
    it "can't create a cat without a image" do
      # params to send with the request
      cat_params = {
        cat: {
          name: "Felcia",
          age: 2,
          enjoys: "borrowing VCRs and not returning them"
        }
      }

      # send request
      post '/cats', params: cat_params
      
      expect(response).to have_http_status(422)

      json = JSON.parse(response.body)
      p json
      expect(json['image']).to include "can't be blank"
    end
        it "can't create a cat without a enjoys that is at least 10 charcters long" do

      cat_params = {
        cat: {
          name: "Felcia",
          age: 2,
          enjoys: "hello",
          image: "https://media.vanityfair.com/photos/5e27310def889c00087c7928/2:3/w_887,h_1331,c_limit/taylor-swift-cats.jpg"
        }
      }

      # send request
      post '/cats', params: cat_params
      
      expect(response).to have_http_status(422)

      json = JSON.parse(response.body)
      p json
      expect(json['enjoys']).to include "is too short (minimum is 10 characters)"
    end
  end
end
