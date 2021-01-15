
import UIKit


protocol ViewControllerDelegate: class {
    func selectedCell(row: Int)
}

class UserProgrammsViewController: UIViewController, ViewControllerDelegate {
   

    let numberOfSections: Int = 3
    var presenter: UserProgrammsPresenterProtocol!
    var rootView: UserProgrammsView? {
        return view as? UserProgrammsView
    }
    
    var tableViewDataSource: UserProgrammsDataSource?
    var tableViewDelegate: UserProgrammsDelegate?
    
    
    // MARK: View lifecycle
    override func loadView() {
        view = UserProgrammsView(frame: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  setUpTableViews()
        setUpNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        setUpNavBar()

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        //making nav controller transparent 
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.presentUserProgramms()
    }
    
   // MARK: ViewControllerDelegate
    func selectedCell(row: Int) {
           print("Row: \(row)")
    }
    
   // MARK: Private methods
    private func setUpNavBar() {
        navigationController?.navigationBar.topItem?.title = "Мои программы"
        navigationController?.navigationBar.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    }
    
    
    
       
}


extension UserProgrammsViewController: UserProgrammsViewProtocol {
    func startLoading() {
        rootView?.refreshControl.startAnimating()
        rootView?.activeTrainingsContainer.isHidden = true
    }
    
    func finishLoading() {
        rootView?.refreshControl.stopAnimating()
        rootView?.activeTrainingsContainer.isHidden = false
    }
    
    func setUserProgramm(userProgramm: UserProgrammsModel) {
        rootView?.activeTrainingsContainer.isHidden = false
        tableViewDataSource = UserProgrammsDataSource(data: userProgramm)
        tableViewDelegate = UserProgrammsDelegate(withDelegate: self,
                                                  programs: userProgramm,
                                                  navController: navigationController ?? UINavigationController())
        
        self.rootView?.activeTrainingsContainer.dataSource = self.tableViewDataSource
        self.rootView?.activeTrainingsContainer.delegate = self.tableViewDelegate
        
        rootView?.activeTrainingsContainer.backgroundColor = .clear
        rootView?.activeTrainingsContainer.reloadData()
    }
}

