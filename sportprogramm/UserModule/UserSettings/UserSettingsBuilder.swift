//
//  UserSettings module
//  Created by Alyona Sabitskaya on 15/11/2020.
//

import UIKit

class UserSettingsBuilder: ModuleBuilder {

    var initialState: UserSettings.ViewControllerState?

    func set(initialState: UserSettings.ViewControllerState) -> UserSettingsBuilder {
        self.initialState = initialState
        return self
    } 

    func build() -> UIViewController {
        let presenter = UserSettingsPresenter()
        let interactor = UserSettingsInteractor(presenter: presenter)
        let controller = UserSettingsViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
