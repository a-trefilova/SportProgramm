//
//  PasswordRecovery module
//  Created by Alyona Sabitskaya on 06/11/2020.
//

import UIKit

class PasswordRecoveryBuilder: ModuleBuilder {

    var initialState: PasswordRecovery.ViewControllerState?

    func set(initialState: PasswordRecovery.ViewControllerState) -> PasswordRecoveryBuilder {
        self.initialState = initialState
        return self
    } 

    func build() -> UIViewController {
        let presenter = PasswordRecoveryPresenter()
        let interactor = PasswordRecoveryInteractor(presenter: presenter)
        let controller = PasswordRecoveryViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
