protocol UserProgrammsViewProtocol {
    func startLoading()
    func finishLoading()
    func setUserProgramm(userProgramm: UserProgrammsModel)
}

protocol UserProgrammsPresenterProtocol {
    init(service: UserProgrammsService, email: String, view: UserProgrammsViewProtocol)
    func presentUserProgramms()
   // func presentUserProgramms(userProgramm: UserProgrammsModel)
    //init(view: UserProgrammsViewProtocol, model: UserProgrammsModel, email: String)
    
}


class UserProgrammsPresenter: UserProgrammsPresenterProtocol {
    
    var userView: UserProgrammsViewProtocol
//    var model: UserProgrammsModel
    var userEmail: String
    var service: UserProgrammsService
    
//    required init(view: UserProgrammsViewProtocol, model: UserProgrammsModel, email: String) {
//
//        self.view = view
//        self.model = model
//        self.userEmail = email
//
//        service.fetchItems(byEmail: email) { (model) in
//            self.presentUserProgramms(userProgramm: model)
//
//        }
//    }
    
    required init(service: UserProgrammsService, email: String, view: UserProgrammsViewProtocol) {
        self.userEmail = email
        self.service = service
        self.userView = view
    }
    
//    func presentUserProgramms(userProgramm: UserProgrammsModel) {
//        userView.setUserProgramm(userProgramm: userProgramm)
//     }
       
    func presentUserProgramms() {
        userView.startLoading()
        service.fetchItems(byEmail: userEmail) { (model) in
            self.userView.finishLoading()
            self.userView.setUserProgramm(userProgramm: model)
        }
    }
}
