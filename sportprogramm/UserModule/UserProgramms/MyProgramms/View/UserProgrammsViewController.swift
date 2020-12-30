
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
        setUpTableViews()
        setUpNavBar()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        setUpNavBar()

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       // navigationController?.navigationBar.isHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
    
    private func setUpNavBar() {
        navigationController?.navigationBar.topItem?.title = "Мои программы"
        //navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //tableView.isUserInteractionEnabled = false
        
        if indexPath.section == 0 {
            //exactly, here should be the access to local database and we should get the closest training from calendar date like (the most recent training will be tommorow 31.12.2020)
            
            guard let ppd = programmsToDisplay?.userProgramms.last?.excersicesByDay.last else { return }
            let builder  = UserDetailedTrainingBuilder(model: ppd)
            let vc = builder.build()
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
        if indexPath.section == 1 {
            guard let programms = programmsToDisplay?.userProgramms else { return }
            let programm = programms[indexPath.row]
            let builer = DetailedProgrammBuilder()
            let vc = builer.build(withProgramm: programm)
            navigationController?.pushViewController(vc, animated: true)
        }
        
        if indexPath.section == 2 {
            guard let programms = programmsToDisplay?.userProgramms else { return }
            let programm = programms[indexPath.row]
            let builer = DetailedProgrammBuilder()
            let vc = builer.build(withProgramm: programm)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
