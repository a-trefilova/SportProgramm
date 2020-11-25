//
//  UserSettings module
//  Created by Alyona Sabitskaya on 15/11/2020.
//

enum UserSettings {
    // MARK: Use cases
    enum Something {
        struct Request {
        }

        struct Response {
            var result: UserSettingsRequestResult
        }

        struct ViewModel {
            var state: ViewControllerState
        }
    }

    enum UserSettingsRequestResult {
        case failure(UserSettingsError)
        case success([UserSettingsModel])
    }

    enum ViewControllerState {
        case loading
        case result([Any/*viewModel*/])
        case emptyResult
        case error(message: String)
    }

    enum UserSettingsError: Error {
        case someError(message: String)
    }
}
