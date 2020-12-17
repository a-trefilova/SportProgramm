

import UIKit

class DetailedProgrammViewController: UIViewController {
    
    var presenter: DetailedProgrammPresenterProtocol?
    var dataModel: FullProgramm? {
        didSet {
            rootView?.containerForDays.reloadData()
        }
    }
    var rootView: DetailedProgrammView? {
        return view as? DetailedProgrammView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = DetailedProgrammView()
        presenter?.presentFullProgramm()
        rootView?.containerForDays.delegate = self
        rootView?.containerForDays.dataSource = self
        rootView?.containerForDays.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpNavBar()
        rootView?.layoutIfNeeded()
    }
    
    
    private func setUpNavBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.tintColor = .white
        guard let dataModel = dataModel else { return }
        rootView?.setUpTitle(title: dataModel.title, description: String(describing: dataModel.numberOfWeeks) + " недель в программе" + "\n" + String(describing: dataModel.excersicesByDay.count) + " тренировок в неделю")
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

    }
    
    
}

extension DetailedProgrammViewController: UICollectionViewDataSource, UICollectionViewDelegate {
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataModel?.numberOfWeeks ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseId, for: indexPath) as! CustomCollectionViewCell
        cell.fillCellFithData(numberOfWeek: indexPath.item + 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCollectionViewCell
        cell.titleLabel.textColor = .black
        cell.underLine.isHidden = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell else { return }
        collectionView.deselectItem(at: indexPath, animated: true)
        cell.titleLabel.textColor = UIColor(red: 198, green: 198, blue: 198, alpha: 1)
        cell.underLine.isHidden = true
    }
}


