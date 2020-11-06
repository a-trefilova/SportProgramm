//
//  PasswordRecovery module
//  Created by Alyona Sabitskaya on 06/11/2020.
//

import UIKit

protocol PasswordRecoveryDisplayLogic: class {
    func displaySomething(viewModel: PasswordRecovery.Something.ViewModel)
}

class PasswordRecoveryViewController: UIViewController {
    let interactor: PasswordRecoveryBusinessLogic
    var state: PasswordRecovery.ViewControllerState

    init(interactor: PasswordRecoveryBusinessLogic, initialState: PasswordRecovery.ViewControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        view = PasswordRecoveryView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
         navigationController?.navigationBar.isHidden = false
        navigationController?.navigationItem.title = "Восстановление пароля"
        doSomething()
    }

    // MARK: Do something
    func doSomething() {
        let request = PasswordRecovery.Something.Request()
        interactor.doSomething(request: request)
    }
}

extension PasswordRecoveryViewController: PasswordRecoveryDisplayLogic {
    func displaySomething(viewModel: PasswordRecovery.Something.ViewModel) {
        display(newState: viewModel.state)
    }

    func display(newState: PasswordRecovery.ViewControllerState) {
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
