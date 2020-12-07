protocol UserProgrammsViewProtocol {
    func setUserProgramm(userProgramm: UserProgrammsModel)
}

protocol UserProgrammsPresenterProtocol {
    func presentUserProgramms(userProgramm: UserProgrammsModel)
    init(view: UserProgrammsViewProtocol, model: UserProgrammsModel)
}


class UserProgrammsPresenter: UserProgrammsPresenterProtocol {
    
    var view: UserProgrammsViewProtocol
    var model: UserProgrammsModel
    
    
    required init(view: UserProgrammsViewProtocol, model: UserProgrammsModel) {
        
        self.view = view
        self.model = model
    }
    
    func presentUserProgramms(userProgramm: UserProgrammsModel) {
        
     }
       
    
}
