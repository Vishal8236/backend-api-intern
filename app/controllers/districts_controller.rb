class DistrictsController < ApplicationController
    
    def create
        #check token is exist or not in request url
        if request.headers["token"]

            # comapare to this token from database 
            if User.first.token == request.headers["token"]
                
                #check state_id name exist or not in params
                if !params[:state_id].present?
                    msg = {
                        "success": false,
                        "status": 400,
                        "message": "State Id is required"
                    }
                    render json: msg
                    return
                end

                #check dictrict name exist or not in params
                if !params[:district_name].present?
                    msg = {
                        "success": false,
                        "status": 400,
                        "message": "Got error while saving",
                        "ERROR": {
                            "district_name": [
                                "District Name cannot be blank."
                            ]
                        }
                    }
                    render json: msg
                    return
                end

                #store new district
                @district = District.new()
                @district.name = params[:district_name]
                @district.states_id = params[:state_id]
                if @district.save
                    msg = {
                        "success": true,
                        "status": 200,
                        "message": "Operation performed successfully"
                    }
                    render json: msg
                end
            else
                #if token not match
                msg = {
                    "success": false,
                    "status": 401,
                    "message": "Wrong number of segments"
                }
                render json: msg
            end
        else
            #if token not present in header
            msg = {
                "success": false,
                "status": 400,
                "message": "token is required"
            }
            render json: msg
        end
    end
    
    def get_district
        if params[:state_id]
            stateId = params[:state_id]
            @all_districts = District.where(states_id: stateId)
            msg= {
                "success": true,
                "status": 200,
                "message": "District Detail",
                "timestamp": 1648474595,
                "district": @all_districts
            }
            render json: msg
        else
            @all_districts = District.all
            msg= {
                "success": true,
                "status": 200,
                "message": "District Detail",
                "timestamp": 1648474595,
                "district": @all_districts
            }
            render json: msg
        end
    end
    
end








