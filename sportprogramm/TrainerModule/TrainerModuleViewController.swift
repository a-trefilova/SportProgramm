//
//  TrainerModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

import UIKit

protocol TrainerModuleDisplayLogic: class {
    func displaySomething(viewModel: TrainerModule.Something.ViewModel)
}

class TrainerModuleViewController: UIViewController {
    let interactor: TrainerModuleBusinessLogic
    var state: TrainerModule.ViewControllerState

    init(interactor: TrainerModuleBusinessLogic, initialState: TrainerModule.ViewControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        let view = TrainerModuleView(frame: UIScreen.main.bounds)
        self.view = view
        // make additional setup of view or save references to subviews
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }

    // MARK: Do something
    func doSomething() {
        let request = TrainerModule.Something.Request()
        interactor.doSomething(request: request)
    }
}

extension TrainerModuleViewController: TrainerModuleDisplayLogic {
    func displaySomething(viewModel: TrainerModule.Something.ViewModel) {
        display(newState: viewModel.state)
    }

    func display(newState: TrainerModule.ViewControllerState) {
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
