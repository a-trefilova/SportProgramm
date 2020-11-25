//
//  UserSettings module
//  Created by Alyona Sabitskaya on 15/11/2020.
//

import UIKit

protocol UserSettingsDisplayLogic: class {
    func displaySomething(viewModel: UserSettings.Something.ViewModel)
}

class UserSettingsViewController: UIViewController {
    let interactor: UserSettingsBusinessLogic
    var state: UserSettings.ViewControllerState

    init(interactor: UserSettingsBusinessLogic, initialState: UserSettings.ViewControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        let view = UserSettingsView(frame: UIScreen.main.bounds)
        self.view = view
        // make additional setup of view or save references to subviews
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        doSomething()
    }

    // MARK: Do something
    func doSomething() {
        let request = UserSettings.Something.Request()
        interactor.doSomething(request: request)
    }
}

extension UserSettingsViewController: UserSettingsDisplayLogic {
    func displaySomething(viewModel: UserSettings.Something.ViewModel) {
        display(newState: viewModel.state)
    }

    func display(newState: UserSettings.ViewControllerState) {
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
