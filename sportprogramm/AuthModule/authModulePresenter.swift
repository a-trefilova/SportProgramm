//
//  authModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

import UIKit

protocol authModulePresentationLogic {
    func presentSomething(response: authModule.Something.Response)
}

/// Отвечает за отображение данных модуля authModule
class authModulePresenter: authModulePresentationLogic {
    weak var viewController: authModuleDisplayLogic?

    // MARK: Do something
    func presentSomething(response: authModule.Something.Response) {
        var viewModel: authModule.Something.ViewModel
        
        switch response.result {
        case let .failure(error):
            viewModel = authModule.Something.ViewModel(state: .error(message: error.localizedDescription))
        case let .success(result):
            if result.isEmpty {
                viewModel = authModule.Something.ViewModel(state: .emptyResult)
            } else {
                viewModel = authModule.Something.ViewModel(state: .result(result))
            }
        }
        
        viewController?.displaySomething(viewModel: viewModel)
    }
}
