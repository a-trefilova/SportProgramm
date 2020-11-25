//
//  UserSettings module
//  Created by Alyona Sabitskaya on 15/11/2020.
//

import UIKit

protocol UserSettingsPresentationLogic {
    func presentSomething(response: UserSettings.Something.Response)
}

/// Отвечает за отображение данных модуля UserSettings
class UserSettingsPresenter: UserSettingsPresentationLogic {
    weak var viewController: UserSettingsDisplayLogic?

    // MARK: Do something
    func presentSomething(response: UserSettings.Something.Response) {
        var viewModel: UserSettings.Something.ViewModel
        
        switch response.result {
        case let .failure(error):
            viewModel = UserSettings.Something.ViewModel(state: .error(message: error.localizedDescription))
        case let .success(result):
            if result.isEmpty {
                viewModel = UserSettings.Something.ViewModel(state: .emptyResult)
            } else {
                viewModel = UserSettings.Something.ViewModel(state: .result(result))
            }
        }
        
        viewController?.displaySomething(viewModel: viewModel)
    }
}
