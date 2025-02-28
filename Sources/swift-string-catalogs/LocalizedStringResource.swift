//
//  LocalizedStringResource.swift
//
//
//  Created by Evan Anderson on 5/16/24.
//

#if !(os(macOS) || os(iOS) || os(tvOS) || os(watchOS)  || os(visionOS))
import Foundation

public extension String {
    struct LocalizationValue : Equatable, ExpressibleByStringInterpolation, Codable, Sendable {

        public enum Placeholder : Codable, Hashable, Sendable {
            case int
            case uint
            case float
            case double
            case object
        }

        let key:String
        let arguments:[String]

        public init(_ value: String) {
            self.key = value
            arguments = []
        }
        public init(stringLiteral value: String) {
            self.key = value
            arguments = []
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

extension String {
    public init(localized resource: LocalizedStringResource) {
        fatalError("not yet implemented")
    }
    public init(localized resource: LocalizedStringResource, options: String.LocalizationOptions) {
        fatalError("not yet implemented")
    }

    public struct LocalizationOptions : @unchecked Sendable {
        public var replacements:[any CVarArg]?
    }

    public struct LocalizedStringKey : Equatable, ExpressibleByStringInterpolation, Sendable {
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

public protocol CustomLocalizedStringResourceConvertible : Sendable {
    var localizedStringResource : LocalizedStringResource { get }
}

public struct LocalizedStringResource : Equatable, Codable, CustomLocalizedStringResourceConvertible, ExpressibleByStringInterpolation {
    public static func == (left: Self, right: Self) -> Bool {
        return left.key == right.key && left.defaultValue == right.defaultValue && left.table == right.table && left.locale == right.locale
    }

    public let key:String
    public let defaultValue:String.LocalizationValue
    public let table:String?
    public var locale:Locale
    public let bundle:LocalizedStringResource.BundleDescription

    public var localizedStringResource:LocalizedStringResource { self }

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

    public init(from decoder: any Decoder) throws {
        fatalError("not yet implemented")
    }

    public func encode(to encoder: any Encoder) throws {
        var container:KeyedEncodingContainer = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(key, forKey: .key)
        let bundleURL:String
        switch bundle {
            case .atURL(let url):
                bundleURL = url.absoluteString
                break
            case .main:
                bundleURL = Bundle.main.bundlePath
                break
            case .forClass(let clazz):
                bundleURL = ""//Bundle.main.classNamed()
                break
        }
        try container.encode(bundleURL, forKey: .bundleURL)
        try container.encode(locale, forKey: .locale)
        try container.encode(defaultValue, forKey: .defaultValue)
    }

    enum CodingKeys : CodingKey {
        case key
        case bundleURL
        case locale
        case sandboxExtensionToken
        case defaultValue
    }

    public typealias ExtendedGraphemeClusterLiteralType = String
    public typealias StringLiteralType = String
    public typealias UnicodeScalarLiteralType = String
}

#endif