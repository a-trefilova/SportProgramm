

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

    var currentDay: Int = 1 {
        didSet {
            rootView?.containerForTrainings.reloadData()
            print(currentDay)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     //   tabBarController?.tabBar.isHidden = false
        view = DetailedProgrammView()
        presenter?.presentFullProgramm()
        rootView?.containerForDays.delegate = self
        rootView?.containerForDays.dataSource = self
        rootView?.containerForDays.register(HorizontalFlowWeekdayCell.self, forCellWithReuseIdentifier: HorizontalFlowWeekdayCell.reuseId)
        rootView?.containerForTrainings.delegate = self
        rootView?.containerForTrainings.dataSource = self
        rootView?.containerForTrainings.register(DailyTrainingCell.self, forCellReuseIdentifier: DailyTrainingCell.reuseId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpNavBar()
        rootView?.layoutIfNeeded()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func setUpNavBar() {
      //  navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.topItem?.title = ""
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
        if  programm.isActive == false {
            rootView?.planButton.isHidden = false
        }
        if programm.isActive == true {
            rootView?.planButton.isHidden = true
        }
    }
    
    
}

extension DetailedProgrammViewController: UICollectionViewDataSource, UICollectionViewDelegate {
   
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataModel?.numberOfWeeks ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalFlowWeekdayCell.reuseId, for: indexPath) as! HorizontalFlowWeekdayCell
        cell.fillCellFithData(numberOfWeek: indexPath.item + 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! HorizontalFlowWeekdayCell
        currentDay = indexPath.item
        cell.titleLabel.textColor = .black
        cell.underLine.isHidden = false
        rootView?.containerForTrainings.isHidden = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? HorizontalFlowWeekdayCell else { return }
        collectionView.deselectItem(at: indexPath, animated: true)
        cell.titleLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        cell.underLine.isHidden = true
        rootView?.containerForTrainings.isHidden = true
    }
}


extension DetailedProgrammViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataModel?.excersicesByDay.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyTrainingCell.reuseId, for: indexPath) as! DailyTrainingCell
        guard let exercises = dataModel?.excersicesByDay[indexPath.row].exercises else { return cell }
        cell.fillCellWithData(data: exercises, numberOfDay: indexPath.item + 1)
        return cell
    }
    

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
}
