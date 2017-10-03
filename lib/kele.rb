require 'httparty'
require 'json'
require './lib/roadmap.rb'

class Kele
    include HTTParty
    include Roadmap
    base_uri 'https://www.bloc.io/api/v1'
    
    def initialize(email, pw)
        @auth = { email: email, password: pw }
        response = self.class.post('/sessions', body: @auth)
        raise 'That didnt work at all' if !@auth
        @auth_token = response['auth_token']
    end
    
    def get_me
        response = self.class.get('/users/me', headers: { "authorization" => @auth_token })
        @me = JSON.parse(response.body)
    end
    
    def get_mentor_availability(mentor_id)
        # mentor_id"=>2362517
        response = self.class.get("/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token }).to_a
        availability = []
        response.each do |meet|
            if meet["booked"] ==  nil
                availability << meet
            end
        end
        puts availability
    end
    
    # def get_roadmap(roadmap_id)
    #     response = self.class.get("/roadmaps/#{roadmap_id}", headers: { "authorization" => @auth_token })
    #     @roadmap = JSON.parse(response.body)
    # end
    
    # def get_checkpoint(cp_id)
    #     response = self.class.get("/checkpoints/#{cp_id}", headers: { "authorization" => @auth_token })
    #     @checkpoints = JSON.parse(response.body)
    # end
        
    
end

# response =  self.class.post('https://www.bloc.io/api/v1/sessions', body: {'email': email, 'password': pw } )