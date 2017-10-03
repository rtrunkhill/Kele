module Roadmap
    def get_roadmap(roadmap_id)
        response = self.class.get("/roadmaps/#{roadmap_id}", headers: { "authorization" => @auth_token })
        @roadmap = JSON.parse(response.body)
    end
    
    def get_checkpoint(cp_id)
        response = self.class.get("/checkpoints/#{cp_id}", headers: { "authorization" => @auth_token })
        @checkpoints = JSON.parse(response.body)
    end
end