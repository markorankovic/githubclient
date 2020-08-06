import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                TextField("Enter username", text: $username)
                Text("Your username: \(username)")
            }
            VStack(alignment: .leading) {
                TextField("Enter password", text: $password)
                Text("Your password: \(password)")
            }
            Button("Login") {
                print("Login details: ", username, ", ", password)
            }
        }.navigationBarTitle("Login to GitHub")
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
