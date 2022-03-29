class ChildsController < ApplicationController
    
    def create
        if request.headers["token"]
            # comapare to this token from database 
            if User.first.token == request.headers["token"]
                if !params[:child].present? 
                    msg = {
                        "success": false,
                        "status": 200,
                        "message": "district Id is required"
                    }
                    render json: msg
                    return
                end

                if params[:child][:district_id].present?
                    @child = Child.new()
                    @child.name = params[:child][:name]
                    @child.father_name = params[:child][:father_name]
                    @child.mother_name = params[:child][:mother_name]
                    @child.sex = params[:child][:sex]
                    @child.district_id = params[:child][:district_id]
                    @child.photo = params[:child][:photo]
                    @child.dob = params[:child][:dob]

                    if @child.save
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
                        "message": "district Id is required"
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
    

    def index
        #check token is exist or not in request url header
        if request.headers[:token]

            # comapare to this token from database 
            if User.first.token == request.headers[:token]
                @all_child = Child.all
                msg = {
                    "success": true,
                    "status": 200,
                    "message": "Child Profile Detail",
                    "timestamp": DateTime.now.to_i,
                    "state": @all_child 
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