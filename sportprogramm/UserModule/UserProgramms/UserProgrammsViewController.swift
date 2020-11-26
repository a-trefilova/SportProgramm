//
//  UserProgramms module
//  Created by Alyona Sabitskaya on 15/11/2020.
//

import UIKit

protocol UserProgrammsDisplayLogic: class {
    func displaySomething(viewModel: UserProgramms.Something.ViewModel)
}

class UserProgrammsViewController: UIViewController {
    let interactor: UserProgrammsBusinessLogic
    var state: UserProgramms.ViewControllerState

    private var rootView: UserProgrammsView? {
        return view as? UserProgrammsView
    }
    
    init(interactor: UserProgrammsBusinessLogic, initialState: UserProgramms.ViewControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        view = UserProgrammsView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Мои программы"
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.title = "Мои программы"
        doSomething()
    }

    // MARK: Do something
    func doSomething() {
        let request = UserProgramms.Something.Request()
        interactor.doSomething(request: request)
    }
}

extension UserProgrammsViewController: UserProgrammsDisplayLogic {
    func displaySomething(viewModel: UserProgramms.Something.ViewModel) {
        display(newState: viewModel.state)
    }

    func display(newState: UserProgramms.ViewControllerState) {
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
