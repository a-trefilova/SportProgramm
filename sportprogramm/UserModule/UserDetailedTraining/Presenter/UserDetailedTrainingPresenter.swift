
import Foundation
protocol UserDetailedTrainingViewProtocol {
    func startLoading()
    func finishLoading()
    func setTraining(forTraining training: ProgrammPerDay)
}

protocol UserDetailedTrainingPresenterProtocol {
    init(view: UserDetailedTrainingViewProtocol, model: ProgrammPerDay)
    func presentTraining()
}


class UserDetailedTrainingPresenter: UserDetailedTrainingPresenterProtocol {
    let view: UserDetailedTrainingViewProtocol
    let model: ProgrammPerDay
    
    required init(view: UserDetailedTrainingViewProtocol, model: ProgrammPerDay) {
        self.view = view
        self.model = model
    }
    
    func presentTraining() {
        view.startLoading()
        view.finishLoading()
        view.setTraining(forTraining: model)
    }
    
    
}
