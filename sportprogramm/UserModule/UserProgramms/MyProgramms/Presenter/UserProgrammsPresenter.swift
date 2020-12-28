import Foundation

protocol UserProgrammsViewProtocol {
    func startLoading()
    func finishLoading()
    func setUserProgramm(userProgramm: UserProgrammsModel)
}

protocol UserProgrammsPresenterProtocol {
    init(model: UserProgrammsModel, view: UserProgrammsViewProtocol)
    func presentUserProgramms()
 
}


class UserProgrammsPresenter: UserProgrammsPresenterProtocol {
    
    var userView: UserProgrammsViewProtocol
    var userModel: UserProgrammsModel

    required init(model: UserProgrammsModel, view: UserProgrammsViewProtocol) {
        self.userModel = model
        self.userView = view
    }
     
    func presentUserProgramms() {
       
        userView.startLoading()

        userView.finishLoading()
        userView.setUserProgramm(userProgramm: userModel)
        
    }
}
