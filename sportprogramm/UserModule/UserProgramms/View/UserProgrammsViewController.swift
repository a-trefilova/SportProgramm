
import UIKit



class UserProgrammsViewController: UIViewController {

    let numberOfSections: Int = 3
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
        
        
        rootView?.refreshControl.hidesWhenStopped = true
        title = "Мои программы"
        
       setUpTableViews()
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.hidesBackButton = true
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Мои программы"
        //navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.hidesBarsOnSwipe = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
    }
    override func viewDidAppear(_ animated: Bool) {
        presenter.presentUserProgramms()
    }
    
    private func setUpTableViews() {
        rootView?.activeTrainingsContainer.isHidden = false
        rootView?.activeTrainingsContainer.dataSource = self
        rootView?.activeTrainingsContainer.delegate = self
        rootView?.activeTrainingsContainer.register(UserProgrammsTableViewCell.self, forCellReuseIdentifier: UserProgrammsTableViewCell.reuseId)
        rootView?.activeTrainingsContainer.register(UserProgrammsRecentTrainingCell.self, forCellReuseIdentifier: UserProgrammsRecentTrainingCell.reuseId)
        
        rootView?.activeTrainingsContainer.backgroundColor = .clear
        
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return 1
        }
        else if section == 1 {
            return programmsToDisplay?.userProgramms.count ?? 1
        }
        else if section == 2 {
            return programmsToDisplay?.userProgramms.count ?? 1
        } else { return 0}
       
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      
        if section == 0{
            return "Ближайшая тренировка"
        }
        else if section == 1 {
            return "Активные программы"
        }
        else if section == 2 {
            return "Нективные программы"
        } else { return nil }
              
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 120
        } else if indexPath.section > 2 {
            return 0
        } else {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
      
            let customCell = tableView.dequeueReusableCell(withIdentifier: UserProgrammsRecentTrainingCell.reuseId, for: indexPath) as! UserProgrammsRecentTrainingCell
            guard let programm = programmsToDisplay?.userProgramms.first, let programmPerDay = programmsToDisplay?.userProgramms.first?.excersicesByDay.first else { return customCell}
             //   customCell.fillCellWithData(programm[indexPath.row])
            customCell.fillCellWithData(dataOfDay: programmPerDay, inProgramm: programm)
                return customCell
        } else if indexPath.section == 1 {
    
            let customCell = tableView.dequeueReusableCell(withIdentifier: UserProgrammsTableViewCell.reuseId, for: indexPath) as! UserProgrammsTableViewCell
                guard let programm = programmsToDisplay?.userProgramms else { return customCell}
                customCell.fillCellWithData(programm[indexPath.row])
                return customCell
        } else if indexPath.section == 2 {
            
            let customCell = tableView.dequeueReusableCell(withIdentifier: UserProgrammsTableViewCell.reuseId, for: indexPath) as! UserProgrammsTableViewCell
                guard let programm = programmsToDisplay?.userProgramms else { return customCell}
                customCell.fillCellWithData(programm[indexPath.row])
                return customCell
        } else {
            let cell = UITableViewCell()
            return cell
        }
    }
    
    
    
}
