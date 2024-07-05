//
//  swift_string_catalogsTests.swift
//
//
//  Created by Evan Anderson on 5/16/24.
//

import XCTest
@testable import SwiftStringCatalogs

final class swift_string_catalogsTests : XCTestCase {
    func testExample() throws {
        /*let decoder:JSONDecoder = JSONDecoder()
        var path:String = #filePath
        path.removeLast("Tests/swift-string-catalogsTests/swift_string_catalogsTests.swift".count)
        path += "Sources/swift-string-catalogs/Resources/Localization/Test.xcstrings"
        guard let data:Data = FileManager.default.contents(atPath: path) else {
            XCTAssert(false, "couldn't find test file located at \"" + path + "\"")
            return
        }
        let value:StringCatalog = try decoder.decode(StringCatalog.self, from: data)
        XCTAssertEqual(value.sourceLanguage, "en")
        XCTAssertEqual(value.version, "1.0")*/

        let encoder:JSONEncoder = JSONEncoder()
        let bro:LocalizedStringResource = LocalizedStringResource(stringLiteral: "who")
        print(try String(data: encoder.encode(bro), encoding: .utf8)!)
        
        /*for (key, entry) in value.strings {
            print(key + ";comment=" + (entry.comment ?? ""))
        }*/
    }
}
