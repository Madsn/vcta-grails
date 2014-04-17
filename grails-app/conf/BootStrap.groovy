import Settings

class BootStrap {
    def init = { servletContext ->
		if (!Settings.count()){
			new Settings(manageAllowed:true).save(failOnError: true)
		}
    }
    def destroy = {
    }
}
