
import UIKit
import SnapKit

extension UserProgrammsView {
    struct Appearance {
        let exampleOffset: CGFloat = 10
    }
}

class UserProgrammsView: UIView {
    let appearance = Appearance()

    var customView: UIScrollView = {
        let view = UIScrollView()
        view.isScrollEnabled = true
        view.isUserInteractionEnabled = true
        view.showsVerticalScrollIndicator = true
        view.indicatorStyle = .default
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        return view
    }()
    
    
    var activeTrainingsContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    var cellForActiveCont = CustomProgrammCellView(title: "Основная программа", numberOfWeeks: 6, numberOfTrainings: 2)
    
    var inactiveTrainingsContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .blue
        return view
    }()

    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews(){
        addSubview(customView)
        let arrayOfContainers = [activeTrainingsContainer, inactiveTrainingsContainer]
        for cont in arrayOfContainers {
            customView.addSubview(cont)
        }
        
        activeTrainingsContainer.addSubview(cellForActiveCont)
    }

    func makeConstraints() {
        customView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
        activeTrainingsContainer.snp.makeConstraints { (make) in
            make.top.equalTo(customView.snp.top)
            make.leading.equalTo(customView.snp.leading)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.greaterThanOrEqualTo(150)
        }
        
        cellForActiveCont.snp.makeConstraints { (make) in
            make.top.equalTo(activeTrainingsContainer.snp.top).offset(20)
            make.leading.equalTo(activeTrainingsContainer.snp.leading).offset(16)
            make.trailing.equalTo(activeTrainingsContainer.snp.trailing).inset(16)
            make.bottom.equalTo(activeTrainingsContainer.snp.bottom).inset(16)
        }
        
        inactiveTrainingsContainer.snp.makeConstraints { (make) in
            make.top.equalTo(activeTrainingsContainer.snp.bottom)
            make.leading.equalTo(customView.snp.leading)
            make.trailing.equalTo(customView.snp.trailing)
            make.bottom.equalTo(customView.snp.bottom)
        }
    }
}


class CustomProgrammCellView: UIView {
    let titleLabel = UILabel()
    let titleOfCell: String?
    let numberOfWeeksLabel = UILabel()
    let weeksLabel = UILabel()
    let numberOfTrainingsPerWeek = UILabel()
    let trainingsLabel = UILabel()
    
    init(title: String, numberOfWeeks: Int, numberOfTrainings: Int) {
        self.titleOfCell = title
        self.titleLabel.text = titleOfCell
        self.numberOfWeeksLabel.text = String(describing: numberOfWeeks)
        weeksLabel.text = "недель"
        self.numberOfTrainingsPerWeek.text = String(describing: numberOfTrainings)
        trainingsLabel.text = "тренировок в неделю"
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        setUpView()
    }

    private func setUpView() {
        backgroundColor = .white
        layer.cornerRadius = 8
        
        addSubview(titleLabel)
        addSubview(numberOfWeeksLabel)
        addSubview(weeksLabel)
        addSubview(numberOfTrainingsPerWeek)
        addSubview(trainingsLabel)
        setUpStyle()
        makeConstraints()
        
    }
    
    private func setUpStyle() {
        titleLabel.font = UIFont(name: "SF Pro Display", size: 16)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.15
        titleLabel.attributedText = NSMutableAttributedString(string: titleOfCell!, attributes: [NSAttributedString.Key.paragraphStyle : paragraphStyle])
        let arrayOfNumberLabels = [numberOfWeeksLabel, numberOfTrainingsPerWeek]
        for item in arrayOfNumberLabels {
            item.font = UIFont(name: "SF Pro Text", size: 24)
        }
        
        
        let arrayOfSubtext = [weeksLabel, trainingsLabel]
        for item in arrayOfSubtext {
            item.font = UIFont(name: "SF Pro Display", size: 14)
            item.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        }
    }
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(14)
            make.leading.equalToSuperview().offset(14)
            
        }
        
        numberOfWeeksLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(14)
            make.bottom.equalToSuperview().inset(14)
        }
        
        weeksLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(numberOfWeeksLabel.snp.trailing).offset(4)
            make.bottom.equalToSuperview().inset(14)
            
        }
        
        numberOfTrainingsPerWeek.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(125)
            make.bottom.equalToSuperview().inset(14)
        }
        
        trainingsLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(numberOfTrainingsPerWeek.snp.trailing).offset(4)
            make.bottom.equalToSuperview().inset(14)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


struct FullProgramm {
    var title: String
    var numberOfWeeks: Int
    var excersicesByDay: [ProgrammPerDay]
}

struct ProgrammPerDay {
    var titleOfDay: String
    var exercises: [Excersice]
}

struct Excersice {
    var title: String
    var numberOfSets: Int
    var numberOfReps: Int
    var weight: Int
    var isSuperset: Bool
    
}
