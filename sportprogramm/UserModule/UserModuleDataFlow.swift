//
//  UserModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

enum UserModule {
    // MARK: Use cases
    enum Something {
        struct Request {
            var tableKey: String
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
        case success([UserProgrammsModel])
    }

    enum ViewControllerState {
        case loading(AuthenticationModuleModel)
        case result([UserProgrammsModel])
        case emptyResult
        case error(message: String)
    }

    enum UserModuleError: Error {
        case someError(message: String)
    }
}
