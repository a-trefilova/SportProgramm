
import UIKit
import SnapKit
class UserActivityViewController: UIViewController {
    
    var presenter: UserActivityPresenterProtocol!
    let activityIndicatorLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Моя активность"
        setUpLabel()
        presenter.showUserActivity()
    }
    
    private func setUpLabel() {
        view.addSubview(activityIndicatorLabel)
        activityIndicatorLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.greaterThanOrEqualTo(150)
        }
    }
}

extension UserActivityViewController: UserActivityViewProtocol {
    func setUserActivity(_ activity: Int) {
        activityIndicatorLabel.text = String(describing: activity)
    }
    
    
}
