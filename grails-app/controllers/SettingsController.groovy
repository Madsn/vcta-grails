import Settings
import Util

class SettingsController {

	static boolean manageAllowed(){
		return Settings.get(1).manageAllowed
	}

	def admin(){
		def settings = Settings.get(1)
		render(view:'manage', model: [settings: settings])
	}

	def update(){
		def settings = Settings.get(1)
		def manageAllowed
		if (params.manageallowed == 'on'){
			manageAllowed = true
		} else {
			manageAllowed = false
		}
		settings.manageAllowed = manageAllowed
		settings.save()
		render(view:'manage', model: [settings: settings])
	}
}
