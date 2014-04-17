import Settings

class SettingsController {
	
	static boolean manageAllowed(){
		return Settings.get(1).manageAllowed
	}

}
