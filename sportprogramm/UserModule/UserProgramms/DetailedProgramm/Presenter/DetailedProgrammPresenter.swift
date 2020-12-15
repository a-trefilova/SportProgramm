
import Foundation

protocol DetailedProgrammViewProtocol {
    func startLoading()
    func finishLoading()
    func setFullProgramm(programm: FullProgramm)
}

protocol DetailedProgrammPresenterProtocol {
    
    init(model: FullProgramm, view: DetailedProgrammViewProtocol)
    func presentFullProgramm()

}

class DetailedProgrammPresenter: DetailedProgrammPresenterProtocol {
    var model: FullProgramm
    var view: DetailedProgrammViewProtocol
    required init(model: FullProgramm, view: DetailedProgrammViewProtocol) {
        self.model = model
        self.view = view
    }
    
    func presentFullProgramm() {
        view.startLoading()
        view.finishLoading()
        view.setFullProgramm(programm: model)
    }
    
    
}
