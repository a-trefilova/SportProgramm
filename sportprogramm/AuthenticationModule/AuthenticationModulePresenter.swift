//
//  AuthenticationModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

import UIKit

protocol AuthenticationModulePresentationLogic {
    func presentSomething(response: AuthenticationModule.Something.Response)
}

/// Отвечает за отображение данных модуля AuthenticationModule
class AuthenticationModulePresenter: AuthenticationModulePresentationLogic {
    weak var viewController: AuthenticationModuleDisplayLogic?

    // MARK: Do something
    func presentSomething(response: AuthenticationModule.Something.Response) {
        var viewModel: AuthenticationModule.Something.ViewModel
        
        switch response.result {
        case let .failure(error):
            viewModel = AuthenticationModule.Something.ViewModel(state: .error(message: error.localizedDescription))
        case let .success(result):
            if result.isEmpty {
                viewModel = AuthenticationModule.Something.ViewModel(state: .emptyResult)
            } else {
                viewModel = AuthenticationModule.Something.ViewModel(state: .result(result))
            }
        }
        
        viewController?.displaySomething(viewModel: viewModel)
    }
}
