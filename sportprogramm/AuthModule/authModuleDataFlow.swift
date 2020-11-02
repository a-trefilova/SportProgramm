//
//  authModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

enum authModule {
    // MARK: Use cases
    enum Something {
        struct Request {
        }

        struct Response {
            var result: authModuleRequestResult
        }

        struct ViewModel {
            var state: ViewControllerState
        }
    }

    enum authModuleRequestResult {
        case failure(authModuleError)
        case success([authModuleModel])
    }

    enum ViewControllerState {
        case loading
        case result([Any/*viewModel*/])
        case emptyResult
        case error(message: String)
    }

    enum authModuleError: Error {
        case someError(message: String)
    }
}
