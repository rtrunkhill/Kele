require 'httparty'
require 'json'

class Kele
    include HTTParty
    base_uri 'https://www.bloc.io/api/v1'
    
    def initialize(email, pw)
        @auth = { email: email, password: pw }
        response = self.class.post('/sessions', body: @auth)
        raise 'That didnt work at all' if !@auth
        @auth_token = response['auth_token']
    end
    
    def get_me
        response = self.class.get('/users/me', headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
    end
end

# response =  self.class.post('https://www.bloc.io/api/v1/sessions', body: {'email': email, 'password': pw } )