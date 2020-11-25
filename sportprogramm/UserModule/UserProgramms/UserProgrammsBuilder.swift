//
//  UserProgramms module
//  Created by Alyona Sabitskaya on 15/11/2020.
//

import UIKit

class UserProgrammsBuilder: ModuleBuilder {

    var initialState: UserProgramms.ViewControllerState?

    func set(initialState: UserProgramms.ViewControllerState) -> UserProgrammsBuilder {
        self.initialState = initialState
        return self
    } 

    func build() -> UIViewController {
        let presenter = UserProgrammsPresenter()
        let interactor = UserProgrammsInteractor(presenter: presenter)
        let controller = UserProgrammsViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
