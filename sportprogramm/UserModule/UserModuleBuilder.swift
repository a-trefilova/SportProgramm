//
//  UserModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

import UIKit

class UserModuleBuilder: ModuleBuilder {

    var initialState: UserModule.ViewControllerState?

    func set(initialState: UserModule.ViewControllerState) -> UserModuleBuilder {
        self.initialState = initialState
        return self
    } 

    func build() -> UIViewController {
        let presenter = UserModulePresenter()
        let interactor = UserModuleInteractor(presenter: presenter)
        let controller = UserModuleViewController(interactor: interactor, initialState: initialState!)

        presenter.viewController = controller
        return controller
    }
}
