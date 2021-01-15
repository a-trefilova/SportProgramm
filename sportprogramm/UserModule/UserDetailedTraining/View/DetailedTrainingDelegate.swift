
import UIKit

class DetailedTrainingDelegate: NSObject, UITableViewDelegate {
    var data: ProgrammPerDay
    var delegate: DetailedTrainingViewControllerDelegate
    
    init(data: ProgrammPerDay, delegate: DetailedTrainingViewControllerDelegate) {
        self.data = data
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
