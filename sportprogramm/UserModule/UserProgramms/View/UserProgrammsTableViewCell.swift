

import UIKit
import SnapKit
class UserProgrammsTableViewCell: UITableViewCell {

    static let reuseId = "CustomCell"
    var programmItemView: CustomProgrammCellView!
    
    func fillCellWithData(_ data: FullProgramm ) {
        programmItemView = CustomProgrammCellView(title: data.title, numberOfWeeks: data.numberOfWeeks, numberOfTrainings: data.excersicesByDay.count)
        contentView.addSubview(programmItemView)
        setUpConstraints()
        self.backgroundColor = .clear
        contentView.backgroundColor = .clear
        let transparentView = UIView()
        transparentView.backgroundColor = .clear
        self.backgroundView = transparentView
    }

    private func setUpConstraints() {
        programmItemView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}

class UserProgrammsRecentTrainingCell: UITableViewCell {
    
    static let reuseId = "TrainingCell"
    var programmItemView: CustomProgrammCellView!
    
    func fillCellWithData(dataOfDay: ProgrammPerDay, inProgramm programm: FullProgramm) {
        programmItemView = CustomProgrammCellView(titleOfCell: dataOfDay.titleOfDay, numberOfExercises: dataOfDay.exercises.count, nameOfLabel: "упражнений", titleOfProgramm: programm.title)
        contentView.addSubview(programmItemView)
        setUpConstraints()
        self.backgroundColor = .clear
        contentView.backgroundColor = .clear
        let transparentView = UIView()
        transparentView.backgroundColor = .clear
        self.backgroundView = transparentView
    }
    
    private func setUpConstraints() {
        programmItemView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}
