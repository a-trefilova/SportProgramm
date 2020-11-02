//
//  authModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

import UIKit

class authModuleBuilder: ModuleBuilder {

    var initialState: authModule.ViewControllerState?

    func set(initialState: authModule.ViewControllerState) -> authModuleBuilder {
        self.initialState = initialState
        return self
    } 

    func build() -> UIViewController {
        let presenter = authModulePresenter()
        let interactor = authModuleInteractor(presenter: presenter)
        let controller = authModuleViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
