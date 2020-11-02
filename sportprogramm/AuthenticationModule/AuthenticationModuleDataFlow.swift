//
//  AuthenticationModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

enum AuthenticationModule {
    // MARK: Use cases
    enum Something {
        struct Request {
        }
        
        struct FirestoreRequest {
            let email: String
            let password: String
        }

        struct Response {
            var result: AuthenticationModuleRequestResult
        }

        struct ViewModel {
            var state: ViewControllerState
        }
    }

    enum AuthenticationModuleRequestResult {
        case failure(AuthenticationModuleError)
        case success([AuthenticationModuleModel])
    }

    enum ViewControllerState {
        case loading
        case result([Any/*viewModel*/])
        case emptyResult
        case error(message: String)
    }

    enum AuthenticationModuleError: Error {
        case someError(message: String)
    }
}
