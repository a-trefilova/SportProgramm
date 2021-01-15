
import UIKit

class DetailedTrainingDataSource: NSObject, UITableViewDataSource {

    var data: ProgrammPerDay
    init(data: ProgrammPerDay) {
        self.data = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyTrainingCell.reuseId, for: indexPath) as! DailyTrainingCell
        let exercises = data.exercises
        cell.showsExpandedVersion = true
        cell.fillCellWithData(data: exercises, numberOfDay: 1)
        cell.setNeedsUpdateConstraints()
        cell.setNeedsLayout()
        return cell
        
    }
    
}
