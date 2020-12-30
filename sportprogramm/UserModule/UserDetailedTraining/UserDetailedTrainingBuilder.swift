
import UIKit

class UserDetailedTrainingBuilder {
    
    var model: ProgrammPerDay
    init(model: ProgrammPerDay) {
           self.model = model
    }
       
    
    func build() -> UIViewController {
        let view = UserDetailedTrainingViewController()
        let presenter = UserDetailedTrainingPresenter(view: view, model: model)
        view.presenter = presenter
        return view
    }
}
