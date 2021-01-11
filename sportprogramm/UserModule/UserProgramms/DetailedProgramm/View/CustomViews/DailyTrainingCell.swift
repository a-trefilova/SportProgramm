
import Foundation
import UIKit
import SnapKit

class DailyTrainingCell: UITableViewCell {
    static var reuseId = "DailyTrainingCell"
    var numberOfExercises: Int = 3
    var numberOfDay: Int = 1
    var exercises: [Excersice]?
    var showsExpandedVersion: Bool = false
    
    private func createOneSubCell(withExercise exercise: Excersice, numberOfExercise: Int, numberOfAllExercises: Int ) -> UIView {

        //setting a count number
        let viewForNumber = UIView()
        viewForNumber.backgroundColor = .black
        viewForNumber.layer.cornerRadius = 8

        let numberOfExerciseLabel = UILabel()
        numberOfExerciseLabel.layer.cornerRadius = 8
        numberOfExerciseLabel.backgroundColor = .black
        numberOfExerciseLabel.textColor = .white
        numberOfExerciseLabel.textAlignment = .center
        numberOfExerciseLabel.font = UIFont(name: "SF Pro Display", size: 14)
        numberOfExerciseLabel.text = String("\(numberOfExercise + 1)")

        //setting connecting line between count numbers
        let connectingViewToTop = UIView()
        connectingViewToTop.backgroundColor = .black

        let connectingViewToBottom = UIView()
        connectingViewToBottom.backgroundColor = .black

        //setting title of exercise
        let exTitleLabel = UILabel()
        exTitleLabel.textColor = .black
        exTitleLabel.font = UIFont(name: "SF Pro Text", size: 14)
        exTitleLabel.textAlignment = .left
        exTitleLabel.numberOfLines = 0
        exTitleLabel.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.32
        let text = exercise.title
        exTitleLabel.attributedText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.kern: -0.41, NSAttributedString.Key.paragraphStyle: paragraphStyle])


        //setting description
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        descriptionLabel.font = UIFont(name: "SF Pro Text", size: 12)
        descriptionLabel.textAlignment = .left
        let paragraphStyleForDescription = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.54
        let descriptionText = "Подходов: " + String(describing: exercise.numberOfSets) + " " + "Повторений: " + String(describing: exercise.numberOfReps) + " " + "Вес: " + String(describing: exercise.weight)
        descriptionLabel.attributedText = NSMutableAttributedString(string: descriptionText, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyleForDescription])


        let viewForSubCell = UIView()
        viewForSubCell.clipsToBounds = true
        viewForSubCell.addSubview(viewForNumber)
        viewForNumber.addSubview(numberOfExerciseLabel)
        viewForSubCell.addSubview(connectingViewToTop)
        viewForSubCell.addSubview(connectingViewToBottom)
        viewForSubCell.addSubview(exTitleLabel)
        viewForSubCell.addSubview(descriptionLabel)

        if numberOfExercise == 0 {
            connectingViewToTop.isHidden = true
        }
        
        if numberOfExercise == numberOfAllExercises - 2 {
            connectingViewToBottom.isHidden = true
        }
        
        viewForNumber.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(5)
            make.height.lessThanOrEqualTo(26)
            make.width.lessThanOrEqualTo(26)
        }

        numberOfExerciseLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        connectingViewToTop.snp.makeConstraints { (make) in
            make.width.equalTo(2)
            make.centerX.equalTo(viewForNumber.snp.centerX)
            make.top.equalToSuperview()
            make.bottom.equalTo(viewForNumber.snp.top).inset(5)
        }

        connectingViewToBottom.snp.makeConstraints { (make) in
            make.width.equalTo(2)
            make.centerX.equalTo(viewForNumber.snp.centerX)
            make.top.equalTo(viewForNumber.snp.bottom).inset(5)
            make.bottom.equalToSuperview()
        }

        exTitleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(numberOfExerciseLabel.snp.trailing).offset(16)
            make.top.equalToSuperview()
        }

        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(exTitleLabel.snp.bottom).offset(9)
            make.leading.equalTo(numberOfExerciseLabel.snp.trailing).offset(16)
            //make.bottom.equalToSuperview()
        }

        
        //setting expanded version
        if showsExpandedVersion == true {
            var arrayOfViews = [UIView]()
            let numberOfSets = exercise.numberOfSets
            for item in 1...numberOfSets {
                let bcView = UIView()
                bcView.backgroundColor = .clear
                
                let viewForNumberOfSet = UIView()
                viewForNumberOfSet.backgroundColor = .black
                viewForNumberOfSet.layer.cornerRadius = 8
                
                let numberOfSetLabel = UILabel()
                numberOfSetLabel.textColor = .white
                numberOfSetLabel.textAlignment = .center
                numberOfSetLabel.text = String(describing: item)
                numberOfSetLabel.font = UIFont(name: "SF Pro Display", size: 16)
                
                
                let descriptionOfSetLabel = UILabel()
                descriptionOfSetLabel.textColor = .black
                descriptionOfSetLabel.font = UIFont(name: "SF Pro Text", size: 14)
                descriptionOfSetLabel.text = "\(exercise.weight)кг/ \(exercise.numberOfReps)повт."
                
                let checkmarkButton = UIButton()
                checkmarkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
                checkmarkButton.imageWith(color: .black, for: .normal)
                checkmarkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
                checkmarkButton.imageWith(color: .black, for: .selected)
                
                
                bcView.addSubview(viewForNumberOfSet)
                viewForNumberOfSet.addSubview(numberOfSetLabel)
                bcView.addSubview(descriptionOfSetLabel)
                bcView.addSubview(checkmarkButton)
                
                viewForNumberOfSet.snp.makeConstraints { (make) in
                    make.leading.equalToSuperview()
                    make.height.equalTo(26)
                    make.width.equalTo(26)
                }
                
                numberOfSetLabel.snp.makeConstraints { (make) in
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                }
                
                descriptionOfSetLabel.snp.makeConstraints { (make) in
                    make.leading.equalTo(viewForNumberOfSet.snp.trailing).offset(12)
                    make.centerY.equalTo(viewForNumberOfSet.snp.centerY)
                }
                
                checkmarkButton.snp.makeConstraints { (make) in
                    make.centerY.equalTo(viewForNumberOfSet.snp.centerY)
                    make.leading.equalTo(descriptionOfSetLabel.snp.trailing).offset(100)
                    make.height.equalTo(16)
                    make.width.equalTo(16)
                }
                
                arrayOfViews.append(bcView)
            }
            
            let stackViewForSets = UIStackView(arrangedSubviews: arrayOfViews)
            stackViewForSets.axis = .vertical
            stackViewForSets.alignment = .leading
            stackViewForSets.distribution = .fillEqually
            stackViewForSets.spacing = 34
            
            viewForSubCell.addSubview(stackViewForSets)
 
            stackViewForSets.snp.makeConstraints { (make) in
                make.top.equalTo(descriptionLabel.snp.bottom).offset(11)
                make.leading.equalTo(descriptionLabel.snp.leading)
                make.trailing.equalTo(viewForSubCell.snp.trailing).offset(-10)
                make.bottom.equalTo(viewForSubCell.snp.bottom).offset(-39)
            }
            
            if numberOfExercise == numberOfAllExercises - 2 {
                connectingViewToBottom.isHidden = false
            }
            
            if numberOfExercise == numberOfAllExercises - 1 {
                connectingViewToBottom.isHidden = true
            }
            
            viewForSubCell.setNeedsUpdateConstraints()
            return viewForSubCell
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
            let view = createOneSubCell(withExercise: item, numberOfExercise: index, numberOfAllExercises: numberOfExercises)
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

