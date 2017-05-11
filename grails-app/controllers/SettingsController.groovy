import Settings
import Util

class SettingsController {
	
	static string welcomeText(){
		return Settings.getAll()[0].welcometext
	}

	static boolean manageAllowed(){
		return Settings.getAll()[0].manageAllowed
	}
	
	static boolean frozen(){
		return Settings.getAll()[0].frozen
	}

	def admin(){
		def settings = Settings.getAll()[0]
		render(view:'manage', model: [settings: settings])
	}

	def update(){
		def settings = Settings.getAll()[0]
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
