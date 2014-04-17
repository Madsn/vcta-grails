class BootStrap {

    def init = { servletContext ->
		if (Settings.findAll().size() == 0){
			Settings setting = new Settings(manageAllowed:true)
			setting.save()
		}
    }
    def destroy = {
    }
}
