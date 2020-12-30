
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
        rootView?.trainingCard.exercises = training.exercises
    
    }
    
    
}
