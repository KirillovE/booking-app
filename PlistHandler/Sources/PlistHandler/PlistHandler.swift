import Foundation

public struct PlistHandler {
    
    private let plistName: String
    
    public init(plistName: String) {
        self.plistName = plistName
    }
    
    public func getValueForKey<T>(
        _ key: String,
        using bundle: Bundle
    ) -> T? {
        guard
            let path = bundle.path(forResource: plistName, ofType: "plist"),
            let info = NSDictionary(contentsOfFile: path) as? [String: AnyObject]
        else { return nil }
        
        return info[key] as? T
    }
    
}
