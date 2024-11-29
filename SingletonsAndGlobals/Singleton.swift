//
//  Singleton.swift
//  SingletonsAndGlobals
//
//  Created by Sharonda Daniels on 11/28/24.
//

import UIKit

// MARK: - Singleton

/// This is an example of a Singleton pattern: you are not able to make your own ApiClient via ApiClient(). A Singleton is a class that has only one instance whereas it provides a single point of access to that instance. In this example, the "ApiClient" class is the Singleton class which contains the "shared" property contains the class' only instance and the only way to access this instance is via "ApiClient.shared".
struct LoggedInUser {}

class ApiClient {
    // On the first call the shared is initalized by creating a new instance of ApiClient(), on subsequent calls it returns the same instance that was made during the first call
    static let shared = ApiClient()
    
    // A private initializer is declared, confirming the prohibition of an initializer declaration that is visible to the module
    private init() {}
    
    func login(completion: (LoggedInUser) -> Void) {}
}

// Since ApiClient is not final, MockApiClient is appropriately allowed to subclass ApiClient for testing purposes
class MockApiClient: ApiClient {}

class LoginViewController: UIViewController {
    var api = ApiClient.shared
    
    func didTapLoginButton() {
        api.login() { user in
            // Show next screen
        }
    }
}
