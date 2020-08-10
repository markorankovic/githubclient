import Foundation
import UIKit

public class Login {
    
    @available(iOS 10.0, *)
    public static func redirectToBrowser() {
        let url = URL(string: "https://github.com/login/oauth/authorize?client_id=3cabd298676f935ca40f&scope=repo")!
        UIApplication.shared.open(url)
    }
        
}
