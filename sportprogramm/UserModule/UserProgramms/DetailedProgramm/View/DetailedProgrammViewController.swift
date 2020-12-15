

import UIKit

class DetailedProgrammViewController: UIViewController {
    
    var presenter: DetailedProgrammPresenterProtocol?
    var dataModel: FullProgramm?
    
    var rootView: DetailedProgrammView? {
        return view as? DetailedProgrammView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = DetailedProgrammView()
        presenter?.presentFullProgramm()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpNavBar()
    }
    
    private func setUpNavBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.tintColor = .white
    }


}

extension DetailedProgrammViewController: DetailedProgrammViewProtocol {
    func startLoading() {
        rootView?.activityIndicator.startAnimating()
        //rootView.tableview.ishidden = true
    }
    
    func finishLoading() {
        rootView?.activityIndicator.stopAnimating()
        
    }
    
    func setFullProgramm(programm: FullProgramm) {
        dataModel = programm
        //rootView.title = dataModel.first.title
        

        //rootView.tableview.ishidden = false
        
        
    }
    
    
}
