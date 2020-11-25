//
//  UserProgramms module
//  Created by Alyona Sabitskaya on 15/11/2020.
//

import UIKit

protocol UserProgrammsPresentationLogic {
    func presentSomething(response: UserProgramms.Something.Response)
}

/// Отвечает за отображение данных модуля UserProgramms
class UserProgrammsPresenter: UserProgrammsPresentationLogic {
    weak var viewController: UserProgrammsDisplayLogic?

    // MARK: Do something
    func presentSomething(response: UserProgramms.Something.Response) {
        var viewModel: UserProgramms.Something.ViewModel
        
        switch response.result {
        case let .failure(error):
            viewModel = UserProgramms.Something.ViewModel(state: .error(message: error.localizedDescription))
        case let .success(result):
            if result.isEmpty {
                viewModel = UserProgramms.Something.ViewModel(state: .emptyResult)
            } else {
                viewModel = UserProgramms.Something.ViewModel(state: .result(result))
            }
        }
        
        viewController?.displaySomething(viewModel: viewModel)
    }
}
