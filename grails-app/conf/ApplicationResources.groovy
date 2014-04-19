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
		wrapper: {s-> "<!-- if lt ie9>$s<!endif-->"}
		resource url:'js/html5shiv.js'
		resource url:'js/respond.min.js'
	}
	
	'chosen' { // http://harvesthq.github.io/chosen/
		dependsOn: 'jquery'
		resource url:'chosen/chosen.min.css'
		resource url:'chosen/chosen.jquery.js'
	}
}