
import UIKit

protocol UserProgrammsBuilderProtocol: class {
    func build() -> UIViewController
}

class UserProgrammsBuilder: UserProgrammsBuilderProtocol {
    var userEmail: String
    let service = UserProgrammsService()
    init(userEmail: String) {
        self.userEmail = userEmail
        
    }
    

    func build() -> UIViewController {
        let view = UserProgrammsViewController()
        if let model = service.fetchItems(byEmail: userEmail) {
            print("************")
            print(model)
            let presenter = UserProgrammsPresenter(view: view, model: model)
            view.presenter = presenter
            return view
        }
        return UIViewController()
    }
    
    
    
}
