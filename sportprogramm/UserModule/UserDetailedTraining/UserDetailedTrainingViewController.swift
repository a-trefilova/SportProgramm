
import UIKit

class UserDetailedTrainingViewController: UIViewController {
    
    var rootView: UserDetailedTrainingView? {
        return view as? UserDetailedTrainingView
    }
    
    var presenter: UserDetailedTrainingPresenter?
    
    override func loadView() {
        view = UserDetailedTrainingView(frame: .zero)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.presentTraining()
        navigationController?.navigationBar.backgroundColor = .clear
        
    }
    

}

extension UserDetailedTrainingViewController: UserDetailedTrainingViewProtocol {
    func startLoading() {
        //rootView.activityIndicator.startAnimating()
    }
    
    func finishLoading() {
        //rootView.activityIndicator.stopAnimating()
    }
    
    func setTraining(forTraining training: ProgrammPerDay) {
        //rootView.title = training.title
       rootView?.titleLabel.text = training.titleOfDay
//        rootView?.trainingCard.fillCellWithData(data: training.exercises,
//            numberOfDay: 1)
        navigationController?.navigationBar.topItem?.title = ""
        let appearance = UINavigationBarAppearance()
        let backBtnAppearance = UIBarButtonItemAppearance(style: .done)
        backBtnAppearance.normal.titlePositionAdjustment = .init(horizontal: 50, vertical: 25)
        appearance.backButtonAppearance = backBtnAppearance
        
        
        rootView?.trainingCard.delegate = self
        rootView?.trainingCard.dataSource = self
        rootView?.trainingCard.register(DailyTrainingCell.self, forCellReuseIdentifier: DailyTrainingCell.reuseId)
        rootView?.trainingCard.tableFooterView = UIView()
    }
    
    
}


extension UserDetailedTrainingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyTrainingCell.reuseId, for: indexPath) as! DailyTrainingCell
        guard let exercises = presenter?.model.exercises else { return cell }
        cell.showsExpandedVersion = true
        cell.fillCellWithData(data: exercises, numberOfDay: 1)
        cell.setNeedsUpdateConstraints()
        cell.setNeedsLayout()
        return cell
        
    }
    
    
}

extension UserDetailedTrainingViewController: UITableViewDelegate {
    
}
