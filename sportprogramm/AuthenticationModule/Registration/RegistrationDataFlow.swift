//
//  Registration module
//  Created by Alyona Sabitskaya on 06/11/2020.
//

enum Registration {
    // MARK: Use cases
    enum Something {
        struct Request {
        }

        struct Response {
            var result: RegistrationRequestResult
        }

        struct ViewModel {
            var state: ViewControllerState
        }
    }

    enum RegistrationRequestResult {
        case failure(RegistrationError)
        case success([RegistrationModel])
    }

    enum ViewControllerState {
        case loading
        case result([Any/*viewModel*/])
        case emptyResult
        case error(message: String)
    }

    enum RegistrationError: Error {
        case someError(message: String)
    }
}
