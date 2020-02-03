# User.create(name:"Ricardo", email:"ricardopaul459@gmail.com", password:"1234567", password_confirmation:"1234567")

{
    "user":{
        "name":"James",
        "email":"james@gmail.com",
        "password":"1234567",
        "password_confirmation":"1234567"
    }
}

{
	"sessions":{
		"email": "ricardopaul459@gmail.com",
		"password": "1234567"
	}
}

{
	"project":{
		"title": "Bring soft dev together",
		"stacks": "rails react redux",
		"description": "Create an environment where we can...",
		"gitlink": "https://github.com/Ricardo-Paul/softbuilders/branches"
	}
}

<!-- Endpoints -->
Create Project:     localhost:3000/api/v1/users/user_id/projects