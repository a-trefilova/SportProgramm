//
//  Registration module
//  Created by Alyona Sabitskaya on 06/11/2020.
//

import UIKit

class RegistrationBuilder: ModuleBuilder {

    var initialState: Registration.ViewControllerState?

    func set(initialState: Registration.ViewControllerState) -> RegistrationBuilder {
        self.initialState = initialState
        return self
    } 

    func build() -> UIViewController {
        let presenter = RegistrationPresenter()
        let interactor = RegistrationInteractor(presenter: presenter)
        let controller = RegistrationViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
