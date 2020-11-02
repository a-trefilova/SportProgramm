//
//  TrainerModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

enum TrainerModule {
    // MARK: Use cases
    enum Something {
        struct Request {
        }

        struct Response {
            var result: TrainerModuleRequestResult
        }

        struct ViewModel {
            var state: ViewControllerState
        }
    }

    enum TrainerModuleRequestResult {
        case failure(TrainerModuleError)
        case success([TrainerModuleModel])
    }

    enum ViewControllerState {
        case loading
        case result([Any/*viewModel*/])
        case emptyResult
        case error(message: String)
    }

    enum TrainerModuleError: Error {
        case someError(message: String)
    }
}
