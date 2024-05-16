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