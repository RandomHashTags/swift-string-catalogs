//
//  StringCatalog.swift
//
//
//  Created by Evan Anderson on 5/16/24.
//

public struct StringCatalog : Codable {
    public let sourceLanguage:String
    public let version:String
    public let strings:[String:StringCatalog.Entry]

    public struct Entry : Codable {
        public let comment:String?
        public let extractionState:ExtractionState
        public let localizations:[String:Variations]?
        
        public enum ExtractionState : String, Codable {
            case manual
            case migrated
        }

        public struct StringUnit : Codable {
            public let stringUnit:Unit
        }
        public struct Unit : Codable {
            public let state:State
            public let value:String

            public enum State : String, Codable {
                case needs_review
                case translated
            }
        }
        public struct Variations : Codable {
            public let stringUnit:Unit?
            public let variations:Variation?

            public struct Variation : Codable {
                public let device:Device?
                public let plural:Plural?
            }

            public struct Device : Codable {
                public let appletv:RawVariations?
                public let applevision:RawVariations?
                public let applewatch:RawVariations?
                public let ipad:RawVariations?
                public let iphone:RawVariations?
                public let ipod:RawVariations?
                public let mac:RawVariations?
                public let other:RawVariations?
            }
            public struct Plural : Codable {
                public let one:StringUnit
                public let other:StringUnit
                public let zero:StringUnit?
            }
        }
        public struct RawVariations : Codable {
            public let variations:Variation?
            public let stringUnit:Unit?

            public struct Variation : Codable {
                public let plural:StringCatalog.Entry.Variations.Plural?
            }
        }
    }
}

#if !(os(macOS) || os(iOS) || os(tvOS) || os(watchOS))
import Foundation
public extension String {
    struct LocalizationValue : Equatable, ExpressibleByStringInterpolation {

        public enum Placeholder : Codable, Hashable, Sendable {
            case int
            case uint
            case float
            case double
            case object
        }

        let key:String
        let value:String

        public init(_ value: String) {
            self.key = value
            self.value = value
        }
        public init(stringLiteral value: String) {
            self.key = value
            self.value = value
        }
    }

    

    init(localized keyAndValue: String.LocalizationValue, table: String? = nil, bundle: Bundle? = nil, locale: Locale = .current, comment: StaticString? = nil) {
    }

    init(localized key: StaticString, defaultValue: String.LocalizationValue, table: String? = nil, bundle: Bundle? = nil, locale: Locale = .current, comment: StaticString? = nil) {
    }

    init(localized keyAndValue: String.LocalizationValue, options: String.LocalizationOptions, table: String? = nil, bundle: Bundle? = nil, locale: Locale = .current, comment: StaticString? = nil) {
    }

    init(localized key: StaticString, defaultValue: String.LocalizationValue, options: String.LocalizationOptions, table: String? = nil, bundle: Bundle? = nil, locale: Locale = .current, comment: StaticString? = nil) {
    }
}

public extension String {
    struct LocalizedStringKey : Equatable, ExpressibleByStringInterpolation {
        public typealias ExtendedGraphemeClusterLiteralType = String
        public typealias StringLiteralType = String
        public typealias UnicodeScalarLiteralType = String

        let value:String

        public init(_ value: String) {
            self.value = value
        }
        public init(stringLiteral value: String) {
            self.value = value
        }
    }
}

#endif