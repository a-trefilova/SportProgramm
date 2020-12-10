
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
        
        var dataModel = UserProgrammsModel(uid: 0, email: "", name: "", userProgramms: [])
        let view = UserProgrammsViewController(data: dataModel)
        view.rootView?.refreshControl.isHidden = false
        view.rootView?.refreshControl.startAnimating()
        view.rootView?.customView.isHidden = true
        service.fetchItems(byEmail: userEmail) { (model) in
            view.rootView?.refreshControl.stopAnimating()
            view.rootView?.refreshControl.isHidden = true
            view.viewWillLayoutSubviews()
            view.rootView?.isHidden = false
            dataModel = model
        }
       
        let presenter = UserProgrammsPresenter(view: view, model: dataModel)
        view.presenter = presenter
        return view
        
      
    }
    
    
    
}
