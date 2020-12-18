
import Foundation
import UIKit
import SnapKit


class DailyTrainingCell: UITableViewCell {
    static var reuseId = "DailyTrainingCell"
    var numberOfExercises: Int = 3
    var numberOfDay: Int = 1
    var exercises: [Excersice]?
    
    private func createOneSubCell(withExercise exercise: Excersice, numberOfExercise: Int) -> UIView {
        let numberOfExerciseLabel = UILabel()
        numberOfExerciseLabel.layer.cornerRadius = 8
        numberOfExerciseLabel.backgroundColor = .black
        numberOfExerciseLabel.textColor = .white
        numberOfExerciseLabel.textAlignment = .center
        numberOfExerciseLabel.font = UIFont(name: "SF Pro Display", size: 14)
        numberOfExerciseLabel.text = String("\(numberOfExercise)")
        
        let exTitleLabel = UILabel()
        exTitleLabel.textColor = .black
        exTitleLabel.font = UIFont(name: "SF Pro Display", size: 14)
        exTitleLabel.textAlignment = .left
        exTitleLabel.text = exercise.title
        
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        descriptionLabel.font = UIFont(name: "SF Pro Text", size: 12)
        descriptionLabel.textAlignment = .left
        descriptionLabel.text = "Подходов: " + String(describing: exercise.numberOfSets) + " " + "Повторений: " + String(describing: exercise.numberOfReps) + " " + "Вес: " + String(describing: exercise.weight)
        
        let viewForSubCell = UIView()
        viewForSubCell.clipsToBounds = true
        viewForSubCell.addSubview(numberOfExerciseLabel)
        viewForSubCell.addSubview(exTitleLabel)
        viewForSubCell.addSubview(descriptionLabel)
        
        numberOfExerciseLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(5)
            make.top.equalToSuperview()
            make.height.lessThanOrEqualTo(26)
            make.width.lessThanOrEqualTo(26)
        }
        
        exTitleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(numberOfExerciseLabel.snp.trailing).offset(16)
            make.top.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(exTitleLabel.snp.bottom)
            make.leading.equalTo(numberOfExerciseLabel.snp.trailing).offset(16)
            make.bottom.equalToSuperview()
        }
        
        return viewForSubCell
    }
    
    func fillCellWithData(data: [Excersice], numberOfDay: Int) {
        let myContentView = UIView()
        myContentView.backgroundColor = .white
        myContentView.layer.cornerRadius = 8
        contentView.addSubview(myContentView)
        myContentView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(15)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.bottom.equalTo(contentView.snp.bottom).offset(-15)
        }
        
        let dayLabel = UILabel()
        dayLabel.textColor = .black
        dayLabel.font =  UIFont(name: "SF Pro Display", size: 14)
        dayLabel.textAlignment = .left
        dayLabel.text = "День " + String(describing: numberOfDay)
        
        numberOfExercises = data.count
        var arrayOfSubviews = [UIView]()
        for (index,item) in data.enumerated() {
            let view = createOneSubCell(withExercise: item, numberOfExercise: index)
            arrayOfSubviews.append(view)
        }
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 8
        backgroundColor = .clear
        layer.cornerRadius = 8
        myContentView.addSubview(dayLabel)
        for item in arrayOfSubviews { myContentView.addSubview(item)}
        
        dayLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(14)
            make.leading.equalToSuperview().offset(14)
        }
        for (index, item) in arrayOfSubviews.enumerated() {
            if index == 0 {
                item.snp.makeConstraints { (make) in
                    make.top.equalTo(dayLabel.snp.bottom)
                    make.leading.equalTo(myContentView.snp.leading).offset(15)
                    make.trailing.equalTo(myContentView.snp.trailing).offset(-15)
                    make.height.greaterThanOrEqualTo(50)
                }
            } else if index == arrayOfSubviews.count - 1 {
                item.snp.makeConstraints { (make) in
                    make.top.equalTo(arrayOfSubviews[index - 1].snp.bottom)
                    make.leading.equalTo(myContentView.snp.leading).offset(15)
                    make.trailing.equalTo(myContentView.snp.trailing).offset(-15)
                    make.bottom.equalTo(myContentView.snp.bottom).offset(-6)

                }
            } else {
                
                item.snp.makeConstraints { (make) in
                    make.top.equalTo(arrayOfSubviews[index - 1].snp.bottom)
                    make.leading.equalTo(myContentView.snp.leading).offset(15)
                    make.trailing.equalTo(myContentView.snp.trailing).offset(-15)
                    make.height.greaterThanOrEqualTo(50)

                }
            }
        }
    }
    
    
}

