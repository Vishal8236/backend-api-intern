class StatesController < ApplicationController
    
    def create
        if params[:state_name]
            @state = State.new
            @state.name = params[:state_name]
            if @state.save()
                msg = {
                    "success": true,
                    "status": 200,
                    "message": "Operation performed successfully"
                }
                render json: msg
            end
        else 
            msg = {
                "success": false,
                "status": 200,
                "message": "Got error while saving",
                "ERROR": {
                    "state_name": [
                        "State Name cannot be blank."
                    ]
                }
            }
            render json: msg
        end 
    end
    
    def index
        #check token is exist or not in request url header
        if request.headers[:token]
            # comapare to this token from database 
            if User.first.token == request.headers[:token]
                @all_state = State.all
                msg = {
                    "success": true,
                    "status": 200,
                    "message": "State Detail",
                    "timestamp": DateTime.now.to_i,
                    "state": @all_state 
                }
                render json: msg
            else
                msg = {
                    "success": false,
                    "status": 401,
                    "message": "Wrong number of segments"
                }
                render json: msg
            end
        else
            msg = {
                "success": false,
                "status": 400,
                "message": "token is required"
            }
            render json: msg
        end
    end
    
end