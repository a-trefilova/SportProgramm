
import UIKit



class UserProgrammsViewController: UIViewController {

    var presenter: UserProgrammsPresenterProtocol!
    var dataModel: UserProgrammsModel
    var rootView: UserProgrammsView? {
        return view as? UserProgrammsView
    }
    
    
//    init(interactor: UserProgrammsBusinessLogic, initialState: UserProgramms.ViewControllerState /*= .loading(String)*/) {
//        self.interactor = interactor
//        self.state = initialState
//        super.init(nibName: nil, bundle: nil)
//    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(data: UserProgrammsModel) {
        self.dataModel = data
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: View lifecycle
    override func loadView() {
        view = UserProgrammsView(frame: .zero, datasource: dataModel)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Мои программы"
       
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Мои программы"
        
//        rootView?.activeTrainingsContainer.delegate = self
//        rootView?.activeTrainingsContainer.dataSource = self
//        doSomething()
    }

    // MARK: Do something
//    func doSomething() {
//        switch state {
//        case .loading(let email):
//            let request = UserProgramms.Something.Request(email: email)
//            interactor.doSomething(request: request)
//        case .result(let result):
//            fallthrough
//        case .emptyResult:
//            fatalError()
//        case .error(message: let message):
//            fatalError()
//        }
//
//
//    }
    
    
    
    
}

//extension UserProgrammsViewController: UserProgrammsDisplayLogic {
//    func displaySomething(viewModel: UserProgramms.Something.ViewModel) {
//        display(newState: viewModel.state)
//    }
//
//    func display(newState: UserProgramms.ViewControllerState) {
//        state = newState
//        switch state {
//        case .loading:
//            print("loading...")
//        case let .error(message):
//            print("error \(message)")
//        case let .result(items):
//            print("result: \(items)")
//        case .emptyResult:
//            print("empty result")
//        }
//    }
//}



//extension UserProgrammsViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = UserProgrammsTableViewCell()
//        return cell
//    }
//
//
//}

extension UserProgrammsViewController: UserProgrammsViewProtocol {
    func setUserProgramm(userProgramm: UserProgrammsModel) {
        
    }
}
