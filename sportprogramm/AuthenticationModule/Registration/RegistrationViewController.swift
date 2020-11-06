//
//  Registration module
//  Created by Alyona Sabitskaya on 06/11/2020.
//

import UIKit

protocol RegistrationDisplayLogic: class {
    func displaySomething(viewModel: Registration.Something.ViewModel)
}

class RegistrationViewController: UIViewController {
    let interactor: RegistrationBusinessLogic
    var state: Registration.ViewControllerState

    init(interactor: RegistrationBusinessLogic, initialState: Registration.ViewControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        let view = RegistrationView(frame: UIScreen.main.bounds)
        self.view = view
        // make additional setup of view or save references to subviews
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }

    // MARK: Do something
    func doSomething() {
        let request = Registration.Something.Request()
        interactor.doSomething(request: request)
    }
}

extension RegistrationViewController: RegistrationDisplayLogic {
    func displaySomething(viewModel: Registration.Something.ViewModel) {
        display(newState: viewModel.state)
    }

    func display(newState: Registration.ViewControllerState) {
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
