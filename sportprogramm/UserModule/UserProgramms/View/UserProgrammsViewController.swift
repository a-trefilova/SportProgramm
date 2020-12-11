
import UIKit



class UserProgrammsViewController: UIViewController {

    var presenter: UserProgrammsPresenterProtocol!
    var rootView: UserProgrammsView? {
        return view as? UserProgrammsView
    }
    
    var programmsToDisplay: UserProgrammsModel?
    
    
    // MARK: View lifecycle
    override func loadView() {
        view = UserProgrammsView(frame: .zero)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView?.activeTrainingsContainer.isHidden = true
        rootView?.activeTrainingsContainer.dataSource = self
        rootView?.activeTrainingsContainer.delegate = self
        rootView?.refreshControl.hidesWhenStopped = true
        title = "Мои программы"
        rootView?.activeTrainingsContainer.register(UserProgrammsTableViewCell.self, forCellReuseIdentifier: UserProgrammsTableViewCell.reuseId)
       
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Мои программы"
        
    }

    override func viewDidAppear(_ animated: Bool) {
        presenter.presentUserProgramms()
    }
}


extension UserProgrammsViewController: UserProgrammsViewProtocol {
    func startLoading() {
        rootView?.refreshControl.startAnimating()
        //rootView?.activeTrainingsContainer.isHidden = true
        //rootView?.cellForActiveCont.isHidden = true
    }
    
    func finishLoading() {
        rootView?.refreshControl.stopAnimating()
        //rootView?.activeTrainingsContainer.isHidden = false
        //rootView?.cellForActiveCont.isHidden = false
    }
    
    func setUserProgramm(userProgramm: UserProgrammsModel) {
        programmsToDisplay = userProgramm
        rootView?.activeTrainingsContainer.isHidden = false
        rootView?.activeTrainingsContainer.reloadData()
    }
}


extension UserProgrammsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        programmsToDisplay?.userProgramms.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: UserProgrammsTableViewCell.reuseId, for: indexPath) as! UserProgrammsTableViewCell
        guard let programm = programmsToDisplay?.userProgramms else { return customCell}
        customCell.fillCellWithData(programm[indexPath.row])
        return customCell
        
    }
    
    
}
