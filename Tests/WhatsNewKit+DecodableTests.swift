import XCTest
@testable import WhatsNewKit
import SwiftUI

final class WhatsNewKitDecodableTests: XCTestCase {
    func testExample() throws {
        
        let json = """
{
    "version": "1.0.0",
    "title": "What's New",
    "features": [
        {
            "image": "star.fill",
            "title": "Title",
            "subtitle": "Subtitle"
        }
    ],
    "primaryAction": "continue",
    "secondaryAction": "learnMore"
}
"""
        let decoder = JSONDecoder()
        decoder.userInfo["star.fill"] = WhatsNew.Feature.Image(systemName: "star.fill")
        decoder.userInfo["continue"] = WhatsNew.PrimaryAction(
            title: "Continue",
            backgroundColor: .accentColor,
            foregroundColor: .white,
            hapticFeedback: .notification(.success),
            onDismiss: {
                print("WhatsNewView has been dismissed")
            }
        )
        decoder.userInfo["learnMore"] = WhatsNew.SecondaryAction(
            title: "Learn more",
            foregroundColor: .accentColor,
            hapticFeedback: .selection,
            action: .openURL(
                .init(string: "https://github.com/SvenTiigi/WhatsNewKit")
            )
        )
        
        let whatsNew = try decoder.decode(WhatsNew.self, from: json.data(using: .utf8)!)
        
        XCTAssertEqual(whatsNew.version, "1.0.0")
        XCTAssertEqual(whatsNew.title, "What's New")
        XCTAssertNotNil(whatsNew.features[0].image)
        XCTAssertEqual(whatsNew.features[0].title, "Title")
        XCTAssertEqual(whatsNew.features[0].subtitle, "Subtitle")
        XCTAssertEqual(whatsNew.primaryAction.title, "Continue")
        XCTAssertEqual(whatsNew.primaryAction.backgroundColor, .accentColor)
        XCTAssertEqual(whatsNew.primaryAction.foregroundColor, .white)
        XCTAssertEqual(whatsNew.primaryAction.hapticFeedback, .notification(.success))
        XCTAssertEqual(whatsNew.secondaryAction!.title, "Learn more")
        XCTAssertEqual(whatsNew.secondaryAction!.foregroundColor, .accentColor)
        XCTAssertEqual(whatsNew.secondaryAction!.hapticFeedback, .selection)
    }
}
