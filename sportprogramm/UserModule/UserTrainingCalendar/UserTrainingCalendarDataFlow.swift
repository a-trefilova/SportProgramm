//
//  UserTrainingCalendar module
//  Created by Alyona Sabitskaya on 15/11/2020.
//

enum UserTrainingCalendar {
    // MARK: Use cases
    enum Something {
        struct Request {
        }

        struct Response {
            var result: UserTrainingCalendarRequestResult
        }

        struct ViewModel {
            var state: ViewControllerState
        }
    }

    enum UserTrainingCalendarRequestResult {
        case failure(UserTrainingCalendarError)
        case success([UserTrainingCalendarModel])
    }

    enum ViewControllerState {
        case loading
        case result([Any/*viewModel*/])
        case emptyResult
        case error(message: String)
    }

    enum UserTrainingCalendarError: Error {
        case someError(message: String)
    }
}
