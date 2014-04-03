class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/" (view: '/login')
		"/dashboard" (view: '/dashboard')
		"500"(view:'/error')

	}
}
