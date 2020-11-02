//
//  UserModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

enum UserModule {
    // MARK: Use cases
    enum Something {
        struct Request {
        }

        struct Response {
            var result: UserModuleRequestResult
        }

        struct ViewModel {
            var state: ViewControllerState
        }
    }

    enum UserModuleRequestResult {
        case failure(UserModuleError)
        case success([UserModuleModel])
    }

    enum ViewControllerState {
        case loading
        case result([Any/*viewModel*/])
        case emptyResult
        case error(message: String)
    }

    enum UserModuleError: Error {
        case someError(message: String)
    }
}