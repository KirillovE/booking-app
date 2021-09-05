import Foundation

struct PlistHandler {
    
    func getValueForKey<T>(_ key: String, using bundle: Bundle) -> T? {
        guard
            let path = bundle.path(forResource: "Test", ofType: "plist"),
            let info = NSDictionary(contentsOfFile: path) as? [String: AnyObject]
        else { return nil }
        
        return info[key] as? T
    }
    
}
