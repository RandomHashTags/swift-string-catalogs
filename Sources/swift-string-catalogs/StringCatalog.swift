//
//  StringCatalog.swift
//
//
//  Created by Evan Anderson on 5/16/24.
//

public struct StringCatalog : Codable, Sendable {
    public let sourceLanguage:String
    public let version:String
    public let strings:[String:StringCatalog.Entry]

    public struct Entry : Codable, Sendable {
        public let comment:String?
        public let extractionState:ExtractionState
        public let localizations:[String:Localization]?
        
        public enum ExtractionState : String, Codable, Sendable {
            case manual
            case migrated
        }

        public struct StringUnit : Codable, Sendable {
            public let stringUnit:Unit
        }
        public struct Unit : Codable, Sendable {
            public let state:State
            public let value:String

            public enum State : String, Codable, Sendable {
                case needs_review
                case new
                case stale
                case translated
            }

            public init(state: State = State.needs_review, value: String) {
                self.state = state
                self.value = value
            }
        }
        public struct Localization : Codable, Sendable {
            public let stringUnit:Unit?
            public let variations:Variations?
            public let substitutions:[String:Substitution]?

            public struct Substitution : Codable, Sendable {
                let argNum:Int
                let formatSpecifier:String
                let variations:Variations

                public struct Variations : Codable, Sendable {
                    public let plural:Plural?
                }
            }
            public struct Variations : Codable, Sendable {
                public let device:Device?
                public let plural:Plural?
            }

            public struct Device : Codable, Sendable {
                public let appletv:RawVariations?
                public let applevision:RawVariations?
                public let applewatch:RawVariations?
                public let ipad:RawVariations?
                public let iphone:RawVariations?
                public let ipod:RawVariations?
                public let mac:RawVariations?
                public let other:RawVariations?
            }
            public struct Plural : Codable, Sendable {
                public let zero:StringUnit?
                public let one:StringUnit
                public let two:StringUnit?
                public let few:StringUnit?
                public let many:StringUnit?
                public let other:StringUnit
            }
        }
        public struct RawVariations : Codable, Sendable {
            public let variations:Variations?
            public let stringUnit:Unit?

            public struct Variations : Codable, Sendable {
                public let plural:StringCatalog.Entry.Localization.Plural?
            }
        }
    }
}