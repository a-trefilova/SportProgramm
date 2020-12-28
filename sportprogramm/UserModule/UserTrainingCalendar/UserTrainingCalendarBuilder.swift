

import UIKit

class UserTrainingCalendarBuilder {
    
    var model: FullProgramm
    init(model: FullProgramm) {
           self.model = model
    }
       
    
    func build() -> UIViewController {
        let view = UserTrainingCalendarViewController()
        let presenter = UserTrainingCalendarPresenter(view: view, programm: model)
        view.presenter = presenter
        return view
    }
}
