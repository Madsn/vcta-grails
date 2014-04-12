modules = {
    application {
        resource url:'js/application.js'
    }
	
//	jquery {
//		resource url:'js/jquery-1.11.0.min.js'
//	}
	
	'bootstrap3' {
		resource url:'js/bootstrap/bootstrap.min.js'
		resource url:'css/bootstrap/bootstrap.min.css'
	}
	
	'login-css' {
		dependsOn: 'bootstrap3, jquery'
		resource url:'css/nimble-login.css'
	}
}