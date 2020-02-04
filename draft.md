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
		"email": "mrlefa55@gmail.com",
		"password": "1234567"
	}
}

{
	"project":{
		"title": "Bring soft dev together",
		"stacks": "rails react redux",
		"description": "Create an environment where we can...",
		"gitlink": "https://github.com/Ricardo-Paul/softbuilders/branches",
        "company_attributes": {
            "name": "Unibank
        }
	}
}

<!-- Endpoints -->
Create Project:     localhost:3000/api/v1/projects/
Show        :      localhost:3000/api/v1/projects/?id=3

Company.create(name:"Unibank", address:"Rue Lamarre, Petion Ville")