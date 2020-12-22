

import UIKit

class UserTrainingCalendarBuilder {
    let instanceOfMockUserData = MockUserProgrammsData()
    func build() -> UIViewController {
        guard let model = instanceOfMockUserData.programm.userProgramms.first else { return UIViewController()}
        let view = UserTrainingCalendarViewController()
        let presenter = UserTrainingCalendarPresenter(view: view, programm: model)
        view.presenter = presenter
        return view
    }
}
