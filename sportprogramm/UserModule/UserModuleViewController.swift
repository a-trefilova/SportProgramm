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

    private var rootView: UserModuleView? {
        return view as? UserModuleView
    }
    
    init(interactor: UserModuleBusinessLogic, initialState: UserModule.ViewControllerState /*= .loading(<#AuthenticationModuleModel#>)*/) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
//    override func loadView() {
//        view = UserModuleView(frame: UIScreen.main.bounds)
//        // make additional setup of view or save references to subviews
//    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUpTapBar()
        
        doSomething()
    }
    
    private func setUpTapBar(){
        let fistvc = UserProgrammsBuilder().build()
        let firstItem = UITabBarItem(title: "Программы", image: UIImage(named: "TrainIcon"), tag: 0)
        fistvc.tabBarItem = firstItem
        
        let secondvc = UserTrainingCalendarBuilder().build()
        let secItem = UITabBarItem(title: "Тренировки", image: UIImage(named: "calendar"), tag: 1)
        secondvc.tabBarItem = secItem
        
        let thirdvc = UserSettingsBuilder().build()
        let thrdItem = UITabBarItem(title: "Настройки", image: UIImage(named: "settings"), tag: 2)
        thirdvc.tabBarItem = thrdItem
        
        let listofvc = [fistvc, secondvc, thirdvc]
        viewControllers = listofvc
    }

    // MARK: Do something
    func doSomething() {
        switch state {
        case .loading(let user):
            rootView?.label.text = user.email
            let request = UserModule.Something.Request(tableKey: user.email!)
            interactor.doSomething(request: request)
        case .result(_):
            print("")
        case .emptyResult:
            print("")
        case .error(message: let message):
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
