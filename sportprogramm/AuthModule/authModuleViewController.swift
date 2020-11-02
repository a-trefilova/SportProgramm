//
//  authModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

import UIKit

protocol authModuleDisplayLogic: class {
    func displaySomething(viewModel: authModule.Something.ViewModel)
}

class authModuleViewController: UIViewController {
    let interactor: authModuleBusinessLogic
    var state: authModule.ViewControllerState

    init(interactor: authModuleBusinessLogic, initialState: authModule.ViewControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        let view = authModuleView(frame: UIScreen.main.bounds)
        self.view = view
        // make additional setup of view or save references to subviews
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }

    // MARK: Do something
    func doSomething() {
        let request = authModule.Something.Request()
        interactor.doSomething(request: request)
    }
}

extension authModuleViewController: authModuleDisplayLogic {
    func displaySomething(viewModel: authModule.Something.ViewModel) {
        display(newState: viewModel.state)
    }

    func display(newState: authModule.ViewControllerState) {
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
