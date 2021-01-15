
import UIKit


protocol DetailedTrainingViewControllerDelegate: class {
    func selectedCell(row: Int)
}

class UserDetailedTrainingViewController: UIViewController {
    
    var rootView: UserDetailedTrainingView? {
        return view as? UserDetailedTrainingView
    }
    
    var presenter: UserDetailedTrainingPresenter?
    
    private var dataSource: DetailedTrainingDataSource?
    private var delegate: DetailedTrainingDelegate?
    
    override func loadView() {
        view = UserDetailedTrainingView(frame: .zero)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.presentTraining()
        navigationController?.navigationBar.backgroundColor = .clear
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
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
        rootView?.titleLabel.text = training.titleOfDay
        
        let appearance = UINavigationBarAppearance()
        let backBtnAppearance = UIBarButtonItemAppearance(style: .done)
        backBtnAppearance.normal.titlePositionAdjustment = .init(horizontal: 50, vertical: 25)
        appearance.backButtonAppearance = backBtnAppearance
        
        dataSource = DetailedTrainingDataSource(data: training)
        delegate = DetailedTrainingDelegate(data: training, delegate: self)
        
        rootView?.trainingCard.delegate = delegate
        rootView?.trainingCard.dataSource = dataSource
        rootView?.trainingCard.register(DailyTrainingCell.self, forCellReuseIdentifier: DailyTrainingCell.reuseId)
        rootView?.trainingCard.tableFooterView = UIView()
    }
    
    
}


extension UserDetailedTrainingViewController: DetailedTrainingViewControllerDelegate {
    func selectedCell(row: Int) {
        print("Row: \(row)")
    }
    
}






