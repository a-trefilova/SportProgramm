//
//  UserTrainingCalendar module
//  Created by Alyona Sabitskaya on 15/11/2020.
//

import UIKit

class UserTrainingCalendarBuilder: ModuleBuilder {

    var initialState: UserTrainingCalendar.ViewControllerState?

    func set(initialState: UserTrainingCalendar.ViewControllerState) -> UserTrainingCalendarBuilder {
        self.initialState = initialState
        return self
    } 

    func build() -> UIViewController {
        let presenter = UserTrainingCalendarPresenter()
        let interactor = UserTrainingCalendarInteractor(presenter: presenter)
        let controller = UserTrainingCalendarViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
