//
//  UserTrainingCalendar module
//  Created by Alyona Sabitskaya on 15/11/2020.
//

import UIKit

protocol UserTrainingCalendarDisplayLogic: class {
    func displaySomething(viewModel: UserTrainingCalendar.Something.ViewModel)
}

class UserTrainingCalendarViewController: UIViewController {
    let interactor: UserTrainingCalendarBusinessLogic
    var state: UserTrainingCalendar.ViewControllerState

    init(interactor: UserTrainingCalendarBusinessLogic, initialState: UserTrainingCalendar.ViewControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        let view = UserTrainingCalendarView(frame: UIScreen.main.bounds)
        self.view = view
        // make additional setup of view or save references to subviews
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Тренировки"
        doSomething()
    }

    // MARK: Do something
    func doSomething() {
        let request = UserTrainingCalendar.Something.Request()
        interactor.doSomething(request: request)
    }
}

extension UserTrainingCalendarViewController: UserTrainingCalendarDisplayLogic {
    func displaySomething(viewModel: UserTrainingCalendar.Something.ViewModel) {
        display(newState: viewModel.state)
    }

    func display(newState: UserTrainingCalendar.ViewControllerState) {
        state = newState
        switch state {
        case .loading:
            print("loading...")
        case let .error(message):
            print("error \(message)")
        case let .result(items):
            print("result: \(items)")
        case .emptyResult:
            print("empty result")
        }
    }
}
