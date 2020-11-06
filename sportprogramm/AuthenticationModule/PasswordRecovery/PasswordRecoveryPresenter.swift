//
//  PasswordRecovery module
//  Created by Alyona Sabitskaya on 06/11/2020.
//

import UIKit

protocol PasswordRecoveryPresentationLogic {
    func presentSomething(response: PasswordRecovery.Something.Response)
}

/// Отвечает за отображение данных модуля PasswordRecovery
class PasswordRecoveryPresenter: PasswordRecoveryPresentationLogic {
    weak var viewController: PasswordRecoveryDisplayLogic?

    // MARK: Do something
    func presentSomething(response: PasswordRecovery.Something.Response) {
        var viewModel: PasswordRecovery.Something.ViewModel
        
        switch response.result {
        case let .failure(error):
            viewModel = PasswordRecovery.Something.ViewModel(state: .error(message: error.localizedDescription))
        case let .success(result):
            if result.isEmpty {
                viewModel = PasswordRecovery.Something.ViewModel(state: .emptyResult)
            } else {
                viewModel = PasswordRecovery.Something.ViewModel(state: .result(result))
            }
        }
        
        viewController?.displaySomething(viewModel: viewModel)
    }
}
