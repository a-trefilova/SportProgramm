//
//  UserTrainingCalendar module
//  Created by Alyona Sabitskaya on 15/11/2020.
//

import UIKit

protocol UserTrainingCalendarPresentationLogic {
    func presentSomething(response: UserTrainingCalendar.Something.Response)
}

/// Отвечает за отображение данных модуля UserTrainingCalendar
class UserTrainingCalendarPresenter: UserTrainingCalendarPresentationLogic {
    weak var viewController: UserTrainingCalendarDisplayLogic?

    // MARK: Do something
    func presentSomething(response: UserTrainingCalendar.Something.Response) {
        var viewModel: UserTrainingCalendar.Something.ViewModel
        
        switch response.result {
        case let .failure(error):
            viewModel = UserTrainingCalendar.Something.ViewModel(state: .error(message: error.localizedDescription))
        case let .success(result):
            if result.isEmpty {
                viewModel = UserTrainingCalendar.Something.ViewModel(state: .emptyResult)
            } else {
                viewModel = UserTrainingCalendar.Something.ViewModel(state: .result(result))
            }
        }
        
        viewController?.displaySomething(viewModel: viewModel)
    }
}
