
import UIKit
import SnapKit

extension UserProgrammsView {
    struct Appearance {
        let exampleOffset: CGFloat = 10
    }
}

class UserProgrammsView: UIView {
    let appearance = Appearance()

    var customView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        return view
    }()

    var activeTrainingsContainer: UITableView = {
        let view = UITableView()
        view.clipsToBounds = true
        return view
    }()

    var refreshControl : UIActivityIndicatorView = {
        let refreshControl = UIActivityIndicatorView()
        
        return refreshControl
    }()
 
    let lineOne: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.3)
        return view
    }()
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        makeConstraints()
        setUpTrainingContainer()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpTrainingContainer() {
        //activeTrainingsContainer.tableFooterView = UIView()
        activeTrainingsContainer.separatorStyle = .none
        
    }
    
    func addSubviews(){
        addSubview(customView)
        customView.addSubview(refreshControl)
        customView.addSubview(lineOne)
        customView.addSubview(activeTrainingsContainer)
    }

    func makeConstraints() {
//        refreshControl.snp.makeConstraints { (make) in
//            make.centerX.equalTo(customView.snp.centerX)
//            make.top.equalTo(activeTrainingsContainer.snp.bottom)
//            make.height.equalTo(40)
//            make.width.equalTo(40)
//        }
        
        customView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        lineOne.snp.makeConstraints { (make) in
            make.top.equalTo(customView.snp.top).offset(180)
            make.leading.equalTo(customView.snp.leading).offset(16)
            make.trailing.equalTo(customView.snp.trailing).offset(16)
            make.height.equalTo(1)
            make.width.equalToSuperview()
        }

        activeTrainingsContainer.snp.makeConstraints { (make) in
            make.top.equalTo(customView.snp.top).offset(200)
            make.leading.equalTo(customView.snp.leading)
            make.width.equalTo(UIScreen.main.bounds.width)
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
    let rightButton = UIButton(type: .detailDisclosure)
    
    init(title: String, numberOfWeeks: Int, numberOfTrainings: Int) {
        self.titleOfCell = title
        self.titleLabel.text = titleOfCell
        self.numberOfWeeksLabel.text = String(describing: numberOfWeeks)
        weeksLabel.text = "недель"
        self.numberOfTrainingsPerWeek.text = String(describing: numberOfTrainings)
        trainingsLabel.text = "тренировок в неделю"
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        setUpView()
        let image = UIImage(named: "chevron_right")
        rightButton.setImage(image, for: .normal)
        rightButton.imageWith(color: UIColor(red: 60, green: 60, blue: 67, alpha: 1), for: .normal)
    }
    
    convenience init(titleOfCell: String, numberOfExercises: Int, nameOfLabel: String, titleOfProgramm: String) {
        self.init(title: titleOfCell, numberOfWeeks: numberOfExercises, numberOfTrainings: 0)
        titleLabel.text = titleOfCell
        numberOfWeeksLabel.text = String(describing: numberOfExercises)
        weeksLabel.text = nameOfLabel
        numberOfTrainingsPerWeek.isHidden = true
        trainingsLabel.isHidden = true 
        //title of programm 
    }

    private func setUpView() {
        backgroundColor = .white
        layer.cornerRadius = 8
        
        addSubview(titleLabel)
        addSubview(numberOfWeeksLabel)
        addSubview(weeksLabel)
        addSubview(numberOfTrainingsPerWeek)
        addSubview(trainingsLabel)
        addSubview(rightButton)
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
        
        rightButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().inset(20)
            make.height.lessThanOrEqualTo(11)
            make.width.lessThanOrEqualTo(6)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension UIImage {
    public func image(withTintColor color: UIColor) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(CGBlendMode.normal)
        let rect: CGRect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context.clip(to: rect, mask: self.cgImage!)
        color.setFill()
        context.fill(rect)
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}

extension UIButton {
    func imageWith(color:UIColor, for: UIControl.State) {
        if let imageForState = self.image(for: state) {
            self.image(for: .normal)?.withRenderingMode(.alwaysTemplate)
            let colorizedImage = imageForState.image(withTintColor: color)
            self.setImage(colorizedImage, for: state)
        }
    }
}

