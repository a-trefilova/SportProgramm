
import UIKit

protocol UserProgrammsBuilderProtocol: class {
    func build() -> UIViewController
}

class UserProgrammsBuilder: UserProgrammsBuilderProtocol {
    
    var model: UserProgrammsModel
    init(model: UserProgrammsModel) {
        self.model = model
    }
    

    func build() -> UIViewController {
        
        let view = UserProgrammsViewController()
        let presenter = UserProgrammsPresenter(model: model, view: view)
        view.presenter = presenter
        
        return view
        
      
    }
    
}
