//
//  StringCatalog.swift
//
//
//  Created by Evan Anderson on 5/16/24.
//

public struct StringCatalog : Hashable, Codable {
    public let sourceLanguage:String
    public let version:String
    public let strings:[String:StringCatalog.Entry]

    public struct Entry : Hashable, Codable {
        public let comment:String?
        public let extractionState:ExtractionState
        public let localizations:[String:Localization]?
        
        public enum ExtractionState : String, Codable {
            case manual
            case migrated
        }

        public struct StringUnit : Hashable, Codable {
            public let stringUnit:Unit
        }
        public struct Unit : Hashable, Codable {
            public let state:State
            public let value:String

            public enum State : String, Codable {
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
        public struct Localization : Hashable, Codable {
            public let stringUnit:Unit?
            public let variations:Variations?
            public let substitutions:[String:Substitution]?

            public struct Substitution : Hashable, Codable {
                let argNum:Int
                let formatSpecifier:String
                let variations:Variations

                public struct Variations : Hashable, Codable {
                    public let plural:Plural?
                }
            }
            public struct Variations : Hashable, Codable {
                public let device:Device?
                public let plural:Plural?
            }

            public struct Device : Hashable, Codable {
                public let appletv:RawVariations?
                public let applevision:RawVariations?
                public let applewatch:RawVariations?
                public let ipad:RawVariations?
                public let iphone:RawVariations?
                public let ipod:RawVariations?
                public let mac:RawVariations?
                public let other:RawVariations?
            }
            public struct Plural : Hashable, Codable {
                public let zero:StringUnit?
                public let one:StringUnit
                public let two:StringUnit?
                public let few:StringUnit?
                public let many:StringUnit?
                public let other:StringUnit
            }
        }
        public struct RawVariations : Hashable, Codable {
            public let variations:Variations?
            public let stringUnit:Unit?

            public struct Variations : Hashable, Codable {
                public let plural:StringCatalog.Entry.Localization.Plural?
            }
        }
    }
}