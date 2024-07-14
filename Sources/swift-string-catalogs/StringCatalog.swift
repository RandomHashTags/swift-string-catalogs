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

    public init(sourceLanguage: String, version: String, strings: [String:StringCatalog.Entry]) {
        self.sourceLanguage = sourceLanguage
        self.version = version
        self.strings = strings
    }

    public struct Entry : Hashable, Codable {
        public let comment:String?
        public let extractionState:ExtractionState
        public let localizations:[String:Localization]?

        public init(comment: String?, extractionState: ExtractionState, localizations: [String:Localization]?) {
            self.comment = comment
            self.extractionState = extractionState
            self.localizations = localizations
        }
        
        public enum ExtractionState : String, Codable {
            case manual
            case migrated
        }

        public struct StringUnit : Hashable, Codable {
            public let stringUnit:Unit

            public init(stringUnit: Unit) {
                self.stringUnit = stringUnit
            }
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

            public init(stringUnit: Unit?, variations: Variations?, substitutions: [String:Substitution]?) {
                self.stringUnit = stringUnit
                self.variations = variations
                self.substitutions = substitutions
            }

            public struct Substitution : Hashable, Codable {
                let argNum:Int
                let formatSpecifier:String
                let variations:Variations

                public init(argNum: Int, formatSpecifier: String, variations: Variations) {
                    self.argNum = argNum
                    self.formatSpecifier = formatSpecifier
                    self.variations = variations
                }

                public struct Variations : Hashable, Codable {
                    public let plural:Plural?

                    public init(plural: Plural?) {
                        self.plural = plural
                    }
                }
            }
            public struct Variations : Hashable, Codable {
                public let device:Device?
                public let plural:Plural?

                public init(device: Device?, plural: Plural?) {
                    self.device = device
                    self.plural = plural
                }
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

                public init(appletv: RawVariations?, applevision: RawVariations?, applewatch: RawVariations?, ipad: RawVariations?, iphone: RawVariations?, ipod: RawVariations?, mac: RawVariations?, other: RawVariations?) {
                    self.appletv = appletv
                    self.applevision = applevision
                    self.applewatch = applewatch
                    self.ipad = ipad
                    self.iphone = iphone
                    self.ipod = ipod
                    self.mac = mac
                    self.other = other
                }
            }
            public struct Plural : Hashable, Codable {
                public let zero:StringUnit?
                public let one:StringUnit
                public let two:StringUnit?
                public let few:StringUnit?
                public let many:StringUnit?
                public let other:StringUnit

                public init(zero: StringUnit?, one: StringUnit, two: StringUnit?, few: StringUnit?, many: StringUnit?, other: StringUnit) {
                    self.zero = zero
                    self.one = one
                    self.two = two
                    self.few = few
                    self.many = many
                    self.other = other
                }
            }
        }
        public struct RawVariations : Hashable, Codable {
            public let variations:Variations?
            public let stringUnit:Unit?

            public init(variations: Variations?, stringUnit: Unit?) {
                self.variations = variations
                self.stringUnit = stringUnit
            }

            public struct Variations : Hashable, Codable {
                public let plural:StringCatalog.Entry.Localization.Plural?

                public init(plural: StringCatalog.Entry.Localization.Plural?) {
                    self.plural = plural
                }
            }
        }
    }
}