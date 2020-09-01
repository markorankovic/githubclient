import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: Int = 1 {
            didSet {
                DispatchQueue.main.async {
                    self.objectWillChange.send(self)
                }
            }
        }
}

