//  Copyright (c) 2015 Commonwealth Bank. All rights reserved.

import Foundation

class DigitalConciergeStep: NSObject {
    let stepID: String
    let order: String
    let enabled: Bool
    let shareEmailWithNicknameText: String?
    let shareEmailWithoutNicknameText: String?
    let numberedList: [String]

    private struct JSONKey {
        static let stepID = "stepId"
        static let order = "order"
        static let enabled = "enabled"
        static let isTriggerForOnboardingComplete = "isTriggerForOnboardingComplete"
        static let headlineText = "headlineText"
        static let primaryButtonText = "primaryButtonText"
        static let shareEmailWithNickNameText = "accountDetailsWithNickname"
        static let shareEmailWithoutNickNameText = "accountDetailsWithoutNickname"
        static let shareSMSText = "shareWithSms"
        static let bodyHeaderText = "bodyHeaderText"
        static let iconImagePath = "icon_imagePath"
        static let iconFullImagePath = "icon_fullImagePath"
        static let numberedList = "numberedList"
    }

    init(stepID: String, order: String, enabled: Bool, shareEmailWithNicknameText: String? = nil, shareEmailWithoutNicknameText: String? = nil, numberedList: [String] = []) {
        self.stepID = stepID
        self.order = order
        self.enabled = enabled
        self.shareEmailWithNicknameText = shareEmailWithNicknameText
        self.shareEmailWithoutNicknameText = shareEmailWithoutNicknameText
        self.numberedList = numberedList
    }

    convenience init?(withData data: NSDictionary) {
        guard let stepID = data[JSONKey.stepID] as? String,
                order = data[JSONKey.order] as? String,
            enabled = data[JSONKey.enabled] as? Bool else {
                return nil
        }

        let shareEmailWithNicknameText = data[JSONKey.shareEmailWithNickNameText] as? String
        let shareEmailWithoutNicknameText = data[JSONKey.shareEmailWithoutNickNameText] as? String
        let numberedList = data[JSONKey.numberedList] as? [String] ?? [String]()

        self.init(stepID: stepID,
            order: order,
            enabled: enabled,
            shareEmailWithNicknameText: shareEmailWithNicknameText,
            shareEmailWithoutNicknameText: shareEmailWithoutNicknameText,
            numberedList: numberedList)
    }
}

let x = DigitalConciergeStep(stepID: "step", order: "order", enabled: true)
print(x)