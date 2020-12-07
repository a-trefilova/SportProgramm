

import UIKit

protocol UserActivityBuilderProtocol {
     func build() -> UIViewController
}

class UserActivityModuleBuilder: UserActivityBuilderProtocol {
     func build() -> UIViewController {
        let model = UserActivity(allTrainingsCount: 10)
        let view = UserActivityViewController()
        let presenter = UserActivityPresenter(view: view, userActivity: model)
        view.presenter = presenter
        return view
    }
    
    
}
