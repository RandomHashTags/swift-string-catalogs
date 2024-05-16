//
//  LocalizedStringResource.swift
//
//
//  Created by Evan Anderson on 5/16/24.
//

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

    /*init(localized keyAndValue: String.LocalizationValue, table: String? = nil, bundle: Bundle? = nil, locale: Locale = .current, comment: StaticString? = nil) {
    }

    init(localized key: StaticString, defaultValue: String.LocalizationValue, table: String? = nil, bundle: Bundle? = nil, locale: Locale = .current, comment: StaticString? = nil) {
    }

    init(localized keyAndValue: String.LocalizationValue, options: String.LocalizationOptions, table: String? = nil, bundle: Bundle? = nil, locale: Locale = .current, comment: StaticString? = nil) {
    }

    init(localized key: StaticString, defaultValue: String.LocalizationValue, options: String.LocalizationOptions, table: String? = nil, bundle: Bundle? = nil, locale: Locale = .current, comment: StaticString? = nil) {
    }*/
}

public extension String {
    struct LocalizationOptions {
        public var replacements:[any CVarArg]?
    }

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

/*public struct LocalizedStringResource : Equatable, Codable, CustomLocalizedStringResourceConvertible, ExpressibleByStringInterpolation {
    public let key:String
    public let defaultValue:String.LocalizationValue
    public let table:String?
    public var locale:Locale
    public private(set) var bundle:LocalizedStringResource.BundleDescription

    //public private(set) var localizedStringResource:LocalizedStringResource

    public enum BundleDescription : Sendable {
        case main
        case forClass(AnyClass)
        case atURL(URL)
    }

    public init(_ keyAndValue: String.LocalizationValue, table: String? = nil, locale: Locale = .current, bundle: LocalizedStringResource.BundleDescription = .main, comment: StaticString? = nil) {
        key = keyAndValue.key
        defaultValue = keyAndValue
        self.table = table
        self.locale = locale
        self.bundle = bundle
    }

    public init(stringLiteral value: String) {
        key = value
        defaultValue = String.LocalizationValue(stringLiteral: value)
        table = nil
        locale = Locale.current
        bundle = LocalizedStringResource.BundleDescription.main
    }

    public typealias ExtendedGraphemeClusterLiteralType = String
    public typealias StringLiteralType = String
    public typealias UnicodeScalarLiteralType = String
}*/

#endif