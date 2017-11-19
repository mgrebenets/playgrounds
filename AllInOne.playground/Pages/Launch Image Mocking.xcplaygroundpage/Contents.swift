//: [Previous](@previous)

import UIKit

extension Bundle {

    public func launchImage(_ screen: UIScreen = UIScreen.main) -> UIImage? {
        guard let name = launchImageName(screen) else { return nil }
        return UIImage(named: name)
    }

    func launchImageName(_ screen: UIScreen) -> String? {
        let viewSize = screen.bounds.size
        let viewOrientation: String = viewSize.width > viewSize.height ? "Landscape" : "Portrait"
        //        if viewSize.width > viewSize.height {
        //            viewOrientation = "Landscape"
        //        } else {
        //            viewOrientation = "Portrait"
        //        }

        guard let infoDic = infoDictionary,
            let images = infoDic["UILaunchImages"] as? [[String: Any]] else { return nil }

        let imageInfo = images.first { image in
            guard let sizeString = image["UILaunchImageSize"] as? String,
                let orientation = image["UILaunchImageOrientation"] as? String else { return false }

            print(sizeString)

            let imageSize = CGSizeFromString(sizeString)
            return imageSize.equalTo(viewSize) && (orientation == viewOrientation)
        }

        return imageInfo?["UILaunchImageName"] as? String
    }
}

class MockBundle: Bundle {
    override var infoDictionary: [String: Any]? {
        return [
            "UILaunchImages": [
                [
                    "UILaunchImageSize": "{768,1024}",
                    "UILaunchImageOrientation": "Portrait",
                    "UILaunchImageName": "Name"
                ]
            ]
        ]
    }
}

class MockScreen: UIScreen {
    private let mockBounds: CGRect
    init(bounds: CGRect) {
        self.mockBounds = bounds
    }

    override var bounds: CGRect {
        return mockBounds
    }
}


let bundle = MockBundle()
let screen = MockScreen(bounds: CGRect(x: 0, y: 0, width: 768, height: 1024))
print(bundle.launchImageName(screen))

//: [Next](@next)
