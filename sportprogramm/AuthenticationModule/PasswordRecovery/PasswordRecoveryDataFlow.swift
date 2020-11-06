//
//  PasswordRecovery module
//  Created by Alyona Sabitskaya on 06/11/2020.
//

enum PasswordRecovery {
    // MARK: Use cases
    enum Something {
        struct Request {
        }

        struct Response {
            var result: PasswordRecoveryRequestResult
        }

        struct ViewModel {
            var state: ViewControllerState
        }
    }

    enum PasswordRecoveryRequestResult {
        case failure(PasswordRecoveryError)
        case success([PasswordRecoveryModel])
    }

    enum ViewControllerState {
        case loading
        case result([Any/*viewModel*/])
        case emptyResult
        case error(message: String)
    }

    enum PasswordRecoveryError: Error {
        case someError(message: String)
    }
}
