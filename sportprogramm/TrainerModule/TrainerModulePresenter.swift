//
//  TrainerModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

import UIKit

protocol TrainerModulePresentationLogic {
    func presentSomething(response: TrainerModule.Something.Response)
}

/// Отвечает за отображение данных модуля TrainerModule
class TrainerModulePresenter: TrainerModulePresentationLogic {
    weak var viewController: TrainerModuleDisplayLogic?

    // MARK: Do something
    func presentSomething(response: TrainerModule.Something.Response) {
        var viewModel: TrainerModule.Something.ViewModel
        
        switch response.result {
        case let .failure(error):
            viewModel = TrainerModule.Something.ViewModel(state: .error(message: error.localizedDescription))
        case let .success(result):
            if result.isEmpty {
                viewModel = TrainerModule.Something.ViewModel(state: .emptyResult)
            } else {
                viewModel = TrainerModule.Something.ViewModel(state: .result(result))
            }
        }
        
        viewController?.displaySomething(viewModel: viewModel)
    }
}
