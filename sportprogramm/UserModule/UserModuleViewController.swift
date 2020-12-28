//
//  UserModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

import UIKit

protocol UserModuleDisplayLogic: class {
    func displaySomething(viewModel: UserModule.Something.ViewModel)
}

class UserModuleViewController: UITabBarController {
    let interactor: UserModuleBusinessLogic
    var state: UserModule.ViewControllerState
    var userModel: UserProgrammsModel?
    private var rootView: UserModuleView? {
        return view as? UserModuleView
    }
    
    init(interactor: UserModuleBusinessLogic, initialState: UserModule.ViewControllerState /*= .loading(<#AuthenticationModuleModel#>)*/) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
        setUpTapBar()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
       // setUpTapBar()
        
        doSomething()
    }
    
    private func setUpTapBar() {
        guard let model = userModel else { return }
        let firstVcBuilder = UserProgrammsBuilder(model: model)
        let fistvc = firstVcBuilder.build()
        
        
        let firstItem = UITabBarItem(title: "Программы", image: UIImage(named: "TrainIcon"), tag: 0)
        fistvc.tabBarItem = firstItem
        
        guard let programm = model.userProgramms.first else { return }
        let secondvc = UserTrainingCalendarBuilder(model: programm).build()
        let secItem = UITabBarItem(title: "Тренировки", image: UIImage(named: "calendar"), tag: 1)
        secondvc.tabBarItem = secItem
        
        let thirdvc = UserSettingsBuilder().build()
        let thrdItem = UITabBarItem(title: "Настройки", image: UIImage(named: "settings"), tag: 2)
        thirdvc.tabBarItem = thrdItem
        
        let listofvc = [fistvc, secondvc, thirdvc]
        viewControllers = listofvc
        
        navigationController?.navigationBar.isHidden = false
        
    }

    // MARK: Do something
    func doSomething() {
        switch state {
        case .loading(let user):
            rootView?.label.text = user.email
            let request = UserModule.Something.Request(tableKey: user.email!)
            interactor.doSomething(request: request)
            print("******************")
            print("\(String(describing: user.email))")
            setUpTapBar()
        case .result(let items):
            userModel = items.first
        case .emptyResult:
            print("")
        case .error(message: _):
            print("")
        }
        
    }
}

extension UserModuleViewController: UserModuleDisplayLogic {
    func displaySomething(viewModel: UserModule.Something.ViewModel) {
        display(newState: viewModel.state)
    }

    func display(newState: UserModule.ViewControllerState) {
        state = newState
        switch state {
        case .loading(let user):
            print("loading...")
        case let .error(message):
            print("error \(message)")
        case let .result(items):
            userModel = items.first
        case .emptyResult:
            print("empty result")
        }
    }
}
