

import UIKit

class UserProgrammsTableViewCell: UITableViewCell {

    var programmItemView: CustomProgrammCellView!
    
    init(data: FullProgramm, style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        fillCellWithData(data)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillCellWithData(_ data: FullProgramm ) {
        programmItemView = CustomProgrammCellView(title: data.title, numberOfWeeks: data.numberOfWeeks, numberOfTrainings: data.excersicesByDay.count)
        contentView.addSubview(programmItemView)
    }

}
