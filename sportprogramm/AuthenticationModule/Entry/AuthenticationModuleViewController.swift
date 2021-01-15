
import UIKit
import WebKit

protocol AuthenticationModuleDisplayLogic: class {
    func displaySomething(viewModel: AuthenticationModule.Something.ViewModel)
}

class AuthenticationModuleViewController: UIViewController {
    let interactor: AuthenticationModuleBusinessLogic
    var state: AuthenticationModule.ViewControllerState
    private var rootView: AuthenticationModuleView? {
        return view as? AuthenticationModuleView
    }
    
    var authData: Dictionary = ["email": String(),
                                "password": String()] as [String : Any]
    
    static var transferToUserModuleModel: AuthenticationModuleModel?
    
    init(interactor: AuthenticationModuleBusinessLogic, initialState: AuthenticationModule.ViewControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        view = AuthenticationModuleView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        navigationController?.navigationBar.isHidden = true
        rootView?.emailTextField.delegate = self
        rootView?.passwordTextField.delegate = self
        rootView?.loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        rootView?.forgotLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(forgotPasswordTappped(gesture:))))
        rootView?.registerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(registerTapped(gesture:))))
        //doSomething()
    }

    @objc func forgotPasswordTappped(gesture: UITapGestureRecognizer) {
        if gesture.state == .recognized {
            rootView?.forgotLabel.isUserInteractionEnabled = false
            let builder = PasswordRecoveryBuilder()
            let vc = builder.build()
            vc.navigationController?.navigationBar.isHidden = false
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    @objc func registerTapped(gesture: UITapGestureRecognizer) {
        if gesture.state == .recognized {
            let builder = RegistrationBuilder()
            let vc = builder.build()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func loginTapped() {
        rootView?.emailTextField.endEditing(true)
        rootView?.passwordTextField.endEditing(true)
        checkIfUserExists()
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: Do something
    func doSomething() {
        let request = AuthenticationModule.Something.Request()
        interactor.doSomething(request: request)
    }
    
    func checkIfUserExists() {
        let request = AuthenticationModule.Something.FirestoreRequest(email: authData["email"] as! String, password: authData["password"] as! String)
        interactor.connectWithFirestore(request: request)
    }
}

extension AuthenticationModuleViewController: AuthenticationModuleDisplayLogic {
    func displaySomething(viewModel: AuthenticationModule.Something.ViewModel) {
        display(newState: viewModel.state)
    }

    func display(newState: AuthenticationModule.ViewControllerState) {
        state = newState
        switch state {
        case .loading:
            print("loading...")
        case let .error(message):
            print("error \(message)")
        case let .result(items):
            print("==========")
            print(items)
            print("==========")
            guard let item = items.first else { return }
            AuthenticationModuleViewController.transferToUserModuleModel = AuthenticationModuleModel(email: item.email, phoneNumber: item.phoneNumber, password: item.password)
            print("result: \(items)")
        case .emptyResult:
            print("empty result")
        }
    }
}

extension AuthenticationModuleViewController: UITextFieldDelegate {
   
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.placeholder == "Email" {
            authData["email"] = textField.text
        }
        if textField.placeholder == "password" {
            authData["password"] = textField.text
        }
    }
}

extension UIView {
    
    
    
    
}

