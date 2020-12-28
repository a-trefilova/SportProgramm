import Foundation

protocol UserTrainingCalendarViewProtocol {
    func startLoading()
    func finishLoading()
    func setTrainingCalendar(forProgramm programm: FullProgramm)
}

protocol UserTrainingCalendarPresenterProtocol {
    init(view: UserTrainingCalendarViewProtocol, programm: FullProgramm)
    func presentCalendar()
}


class UserTrainingCalendarPresenter: UserTrainingCalendarPresenterProtocol {
   // let instanceOfMockUserData = MockUserProgrammsData()
    let view: UserTrainingCalendarViewProtocol
    let model: FullProgramm
    
    required init(view: UserTrainingCalendarViewProtocol, programm: FullProgramm) {
        self.view = view
        self.model = programm
    }
    
    func presentCalendar() {
        view.startLoading()
        view.finishLoading()
        view.setTrainingCalendar(forProgramm: model)
    }
    
    
}

