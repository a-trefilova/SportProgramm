
import UIKit

class UserProgrammsDataSource: NSObject, UITableViewDataSource {
    
    var programmsToDisplay: UserProgrammsModel
    
    init(data: UserProgrammsModel) {
        self.programmsToDisplay = data
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
    
    //MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
     
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return chooseActiveProgramms().count
        }
        else if section == 2 {
            return chooseInactiveProgramms().count
            
        } else { return 0 }
       
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      
        if section == 0{
            return "Ближайшая тренировка"
        }
        else if section == 1 {
            return "Активные программы"
        }
        else if section == 2 {
            return "Нективные программы"
        } else { return nil }
              
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 120
        } else if indexPath.section > 2 {
            return 0
        } else {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        tableView.register(UserProgrammsTableViewCell.self, forCellReuseIdentifier: UserProgrammsTableViewCell.reuseId)
        tableView.register(UserProgrammsRecentTrainingCell.self, forCellReuseIdentifier: UserProgrammsRecentTrainingCell.reuseId)
        
        if indexPath.section == 0 {
      
            let customCell = tableView.dequeueReusableCell(withIdentifier: UserProgrammsRecentTrainingCell.reuseId, for: indexPath) as! UserProgrammsRecentTrainingCell
            guard let programm = programmsToDisplay.userProgramms.first, let programmPerDay = programmsToDisplay.userProgramms.first?.excersicesByDay.first else { return customCell}
             //   customCell.fillCellWithData(programm[indexPath.row])
            customCell.fillCellWithData(dataOfDay: programmPerDay, inProgramm: programm)
                return customCell
        } else if indexPath.section == 1 {
            let programms = chooseActiveProgramms()
            let customCell = tableView.dequeueReusableCell(withIdentifier: UserProgrammsTableViewCell.reuseId, for: indexPath) as! UserProgrammsTableViewCell
            customCell.fillCellWithData(programms[indexPath.row])
            return customCell
          
        } else if indexPath.section == 2 {
            let programms = chooseInactiveProgramms()
            let customCell = tableView.dequeueReusableCell(withIdentifier: UserProgrammsTableViewCell.reuseId, for: indexPath) as! UserProgrammsTableViewCell
            customCell.fillCellWithData(programms[indexPath.row])
            return customCell
        } else {
            let cell = UITableViewCell()
            return cell
        }
    }

}






