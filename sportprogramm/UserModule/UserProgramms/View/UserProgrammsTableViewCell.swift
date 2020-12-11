

import UIKit

class UserProgrammsTableViewCell: UITableViewCell {

    static let reuseId = "CustomCell"
    var programmItemView: CustomProgrammCellView!
    
    func fillCellWithData(_ data: FullProgramm ) {
        programmItemView = CustomProgrammCellView(title: data.title, numberOfWeeks: data.numberOfWeeks, numberOfTrainings: data.excersicesByDay.count)
        contentView.addSubview(programmItemView)
    }

}
