modules = {
    application {
        resource url:'js/application.js'
    }
	
	'bootstrap3' {
		resource url:'js/bootstrap/bootstrap.min.js'
		resource url:'css/bootstrap/bootstrap.min.css'
	}
	
	'login-css' {
		dependsOn: 'bootstrap3, jquery'
		resource url:'css/nimble-login.css'
	}
	
	'legacy-support' { // IE8
		resource url:'js/html5shiv.min.js'
		resource url:'js/respond.min.js'
	}
}