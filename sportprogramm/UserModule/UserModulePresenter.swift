//
//  UserModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

import UIKit

protocol UserModulePresentationLogic {
    func presentSomething(response: UserModule.Something.Response)
}

/// Отвечает за отображение данных модуля UserModule
class UserModulePresenter: UserModulePresentationLogic {
    weak var viewController: UserModuleDisplayLogic?

    // MARK: Do something
    func presentSomething(response: UserModule.Something.Response) {
        var viewModel: UserModule.Something.ViewModel
        
        switch response.result {
        case let .failure(error):
            viewModel = UserModule.Something.ViewModel(state: .error(message: error.localizedDescription))
        case let .success(result):
            if result.isEmpty {
                viewModel = UserModule.Something.ViewModel(state: .emptyResult)
            } else {
                viewModel = UserModule.Something.ViewModel(state: .result(result))
            }
        }
        
        viewController?.displaySomething(viewModel: viewModel)
    }
}
