Xcode string catalogs are very powerful, but their accessibility is not available on other platforms other than Apple. This package fixes that.

## Usage
```swift
let decoder:JSONDecoder = JSONDecoder()
guard let data:Data = FileManager.default.contents(atPath: path) else {
        return
}
let value:StringCatalog = try decoder.decode(StringCatalog.self, from: data)
```
