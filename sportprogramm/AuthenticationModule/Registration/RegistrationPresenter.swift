//
//  Registration module
//  Created by Alyona Sabitskaya on 06/11/2020.
//

import UIKit

protocol RegistrationPresentationLogic {
    func presentSomething(response: Registration.Something.Response)
}

/// Отвечает за отображение данных модуля Registration
class RegistrationPresenter: RegistrationPresentationLogic {
    weak var viewController: RegistrationDisplayLogic?

    // MARK: Do something
    func presentSomething(response: Registration.Something.Response) {
        var viewModel: Registration.Something.ViewModel
        
        switch response.result {
        case let .failure(error):
            viewModel = Registration.Something.ViewModel(state: .error(message: error.localizedDescription))
        case let .success(result):
            if result.isEmpty {
                viewModel = Registration.Something.ViewModel(state: .emptyResult)
            } else {
                viewModel = Registration.Something.ViewModel(state: .result(result))
            }
        }
        
        viewController?.displaySomething(viewModel: viewModel)
    }
}
