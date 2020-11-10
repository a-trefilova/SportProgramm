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
    var dataModelSendedToFirebase: RegistrationModel?
    
    private var rootView: RegistrationView? {
        return view as? RegistrationView
    }
    
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
        view = RegistrationView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        rootView?.loginButton.addTarget(self, action: #selector(sendDatamodel), for: .touchUpInside)
        //doSomething()
    }
    
    @objc func sendDatamodel() {
        getDataModel()
        doSomething()
    }
    
    private func getDataModel() {
       guard let email = rootView?.emailTf.text,
        let name = rootView?.nameTf.text,
        let password = rootView?.passwordTf.text
        else { return }
        dataModelSendedToFirebase = RegistrationModel(uid: 0, name: name, email: email, password: password)
    }
    
    // MARK: Do something
    func doSomething() {
        guard let datamodel = dataModelSendedToFirebase else { return }
        let request = Registration.Something.Request(datamodel: datamodel)
        //interactor.doSomething(request: request)
        interactor.sendingDatamodel(request: request)
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
            let builder = AuthenticationModuleBuilder()
            let vc = builder.build()
            navigationController?.pushViewController(vc, animated: true)
            print("result: \(items)")
        case .emptyResult:
            print("empty result")
        }
    }
}
