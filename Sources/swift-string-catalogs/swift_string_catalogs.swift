// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct StringCatalog : Codable {
    public let sourceLanguage:String
    public let version:String
    public let strings:[String:StringCatalog.Entry]
}

public extension StringCatalog {
    struct Entry : Codable {
        public let comment:String?
        public let extractionState:ExtractionState
        public let localizations:[String:Localizations.Variations]?
        
        public enum ExtractionState : String, Codable {
            case manual
            case migrated
        }

        public struct Localizations : Codable {
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
                public let variations:Variation

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
                public let variations:Variation

                public struct Variation : Codable {
                    public let plural:StringCatalog.Entry.Localizations.Variations.Plural?
                }
            }
        }
    }
}