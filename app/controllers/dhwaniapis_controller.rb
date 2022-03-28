class DhwaniapisController < ApplicationController
    def login
        @user = User.first
        if @user.username == params[:username] && @user.password == params[:password]

            # generate rendom string for token
            string_length = 150
            token = rand(36**string_length).to_s(36)
            
            # update token and login_id and last_login from user table
            updateData(token)
            
            # render message
            msg = {
                "success":  true,
                "status": 200,
                "message": "Login successfull.",
                "token": "#{User.first.token}",
                "login_id": User.first.login_id,
                "last_login": User.first.last_login.to_i,
                "timestamp": 1648467009
            }
            render json: msg
        else
            render json: "Invalid username and password"
        end
        
    end

    def logout
        #get token by request
        getToken = params[:token]

        # comapare to this token from database 
        if User.first.token == getToken
            msg = {
                "success": true,
                "status": 200,
                "message": "Successfully logged out"
            }
            render json: msg
        else
            msg = {
                "success": false,
                "status": 401,
                "message": "Invalid segment encoding"
            }
            render json: msg
        end
    end

    private 
    def updateData(gettoken)
        User.first.update(
            token: gettoken,
            login_id: User.first.login_id+1,
            last_login: DateTime.now
        )
    end
    
end