
import UIKit

class UserProgrammsDelegate: NSObject, UITableViewDelegate {
    
    var programmsToDisplay: UserProgrammsModel
    var navController: UINavigationController
    weak var delegate: ViewControllerDelegate?
    
    init(withDelegate delegate: ViewControllerDelegate, programs: UserProgrammsModel, navController: UINavigationController) {
        self.delegate = delegate
        self.programmsToDisplay = programs
        self.navController = navController
    }
    
    //MARK: Private Methods
    private func chooseActiveProgramms() -> [FullProgramm] {
       
        var arrayOfActiveProgramms = [FullProgramm]()
        for item in programmsToDisplay.userProgramms {
            if item.isActive == true {
                arrayOfActiveProgramms.append(item)
            }
        }
        return arrayOfActiveProgramms
    }
    
    private func chooseInactiveProgramms() -> [FullProgramm] {
      
        var arrayOfInactiveProgramms = [FullProgramm]()
        for item in programmsToDisplay.userProgramms {
            if item.isActive == false {
                arrayOfInactiveProgramms.append(item)
            }
        }
        return arrayOfInactiveProgramms
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.delegate?.selectedCell(row: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
            //tableView.isUserInteractionEnabled = false
            
            if indexPath.section == 0 {
                //exactly, here should be the access to local database and we should get the closest training from calendar date like (the most recent training will be tommorow 31.12.2020)
                
                guard let ppd = programmsToDisplay.userProgramms.last?.excersicesByDay.last else { return }
                let builder  = UserDetailedTrainingBuilder(model: ppd)
                let vc = builder.build()
                navController.pushViewController(vc, animated: true)
            }
            
            
            if indexPath.section == 1 {
                let programms = chooseActiveProgramms()
                let programm = programms[indexPath.row]
                let builer = DetailedProgrammBuilder()
                let vc = builer.build(withProgramm: programm)
                
                navController.pushViewController(vc, animated: true)
            }
            
            if indexPath.section == 2 {
                let programms = chooseInactiveProgramms()
                let programm = programms[indexPath.row]
                let builer = DetailedProgrammBuilder()
                let vc = builer.build(withProgramm: programm)
                navController.pushViewController(vc, animated: true)
            }
        
        
    }
    
}
