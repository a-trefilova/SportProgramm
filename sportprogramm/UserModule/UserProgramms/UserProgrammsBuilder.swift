
import UIKit

protocol UserProgrammsBuilderProtocol: class {
    func build() -> UIViewController
}

class UserProgrammsBuilder: UserProgrammsBuilderProtocol {
    var userEmail: String
    
    init(userEmail: String) {
        self.userEmail = userEmail
        
    }
    

    func build() -> UIViewController {
        
        //let dataModel = UserProgrammsModel(uid: 0, email: "", name: "", userProgramms: [])
        let view = UserProgrammsViewController()
        let presenter = UserProgrammsPresenter(service: UserProgrammsService(), email: userEmail, view: view)
        view.presenter = presenter
        
        return view
        
      
    }
    
}
