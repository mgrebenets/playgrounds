

class App {
    // TODO:

    class var shared: App {
        struct Static {
            static let sharedInstance = App()
        }
        return Static.sharedInstance
    }

    func say() {
    	println("App")
    }
}


class CustomApp: App {
	override func say() {
    	println("CustomApp")
    }
}


App.shared.say()
CustomApp.shared.say()
