//
//  TrainerModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

import UIKit

class TrainerModuleBuilder: ModuleBuilder {
   

    var initialState: TrainerModule.ViewControllerState?

    func set(initialState: TrainerModule.ViewControllerState) -> TrainerModuleBuilder {
        self.initialState = initialState
        return self
    } 

    func build() -> UIViewController {
        let presenter = TrainerModulePresenter()
        let interactor = TrainerModuleInteractor(presenter: presenter)
        let controller = TrainerModuleViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}

protocol ModuleBuilder {
    func build() -> UIViewController
}
