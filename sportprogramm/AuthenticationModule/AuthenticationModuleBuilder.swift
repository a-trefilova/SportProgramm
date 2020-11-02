//
//  AuthenticationModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

import UIKit

class AuthenticationModuleBuilder: ModuleBuilder {

    var initialState: AuthenticationModule.ViewControllerState?

    func set(initialState: AuthenticationModule.ViewControllerState) -> AuthenticationModuleBuilder {
        self.initialState = initialState
        return self
    } 

    func build() -> UIViewController {
        let presenter = AuthenticationModulePresenter()
        let interactor = AuthenticationModuleInteractor(presenter: presenter)
        let controller = AuthenticationModuleViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
