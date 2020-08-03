#if os(macOS)
import AppKit

public typealias Pasteboard = NSPasteboard

extension Pasteboard {
    
    public static func copy(_ string: String) {
        Pasteboard.general.clearContents()
        Pasteboard.general.setData(string.data(using: .utf8), forType: .string)
    }
}
#endif
