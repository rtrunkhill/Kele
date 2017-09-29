require 'httparty'

class Kele
    include HTTParty
    base_uri 'https://www.bloc.io/api/v1'
    
    def initialize(email, pw)
        @auth = { email: email, password: pw }
        response = self.class.post('https://www.bloc.io/api/v1/sessions', body: @auth)
        raise 'That didnt work at all' if !@auth
    end
end

# response =  self.class.post('https://www.bloc.io/api/v1/sessions', body: {'email': email, 'password': pw } )