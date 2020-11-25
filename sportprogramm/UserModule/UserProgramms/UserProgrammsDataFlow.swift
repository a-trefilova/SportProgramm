//
//  UserProgramms module
//  Created by Alyona Sabitskaya on 15/11/2020.
//

enum UserProgramms {
    // MARK: Use cases
    enum Something {
        struct Request {
        }

        struct Response {
            var result: UserProgrammsRequestResult
        }

        struct ViewModel {
            var state: ViewControllerState
        }
    }

    enum UserProgrammsRequestResult {
        case failure(UserProgrammsError)
        case success([UserProgrammsModel])
    }

    enum ViewControllerState {
        case loading
        case result([Any/*viewModel*/])
        case emptyResult
        case error(message: String)
    }

    enum UserProgrammsError: Error {
        case someError(message: String)
    }
}
