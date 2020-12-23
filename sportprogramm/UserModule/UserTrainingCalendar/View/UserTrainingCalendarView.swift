
import UIKit
import SnapKit
import JTAppleCalendar

extension UserTrainingCalendarView {
    struct Appearance {
        let exampleOffset: CGFloat = 10
    }
}

class UserTrainingCalendarView: UIView {
    let appearance = Appearance()

    var customView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var containerForTitle: CustomGradientNavbar = {
           let view = CustomGradientNavbar()
           view.clipsToBounds = true
           return view
       
       }()
    
//    var calendarMonthHeader: JTACMonthReusableView = {
//        
//    }()
    
    var calendarView: JTACMonthView = {
        let view = JTACMonthView()
        view.backgroundColor = .white
        view.cellSize = 45
        view.allowsMultipleSelection = true
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
        customView.addSubview(containerForTitle)
        customView.addSubview(calendarView)
        
    }

    func makeConstraints() {
        customView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        containerForTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(customView.snp.leading)
            make.trailing.equalTo(customView.snp.trailing)
            make.height.lessThanOrEqualTo(200)
        }
        
        calendarView.snp.makeConstraints { (make) in
            make.top.equalTo(containerForTitle.snp.bottom)
            make.leading.equalTo(customView.snp.leading)
            make.trailing.equalTo(customView.snp.trailing)
            make.bottom.equalTo(customView.snp.bottom).offset(-150)
        }
    }
    
    func setUpTitle(title: String, description: String) {
        
        containerForTitle.titleLabel.text = title
        containerForTitle.descriptionLabel.text = description
        setNeedsDisplay()
        setNeedsLayout()
        setNeedsUpdateConstraints()
    }
}


class CustomCalendarCell: JTACDayCell {
    static let reuseId = "dateCell"
    private let label = UILabel()
    private let selectedView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.775, green: 0.775, blue: 0.775, alpha: 1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentMode = .center
        
        contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(contentView.snp.width)
            make.width.equalTo(contentView.snp.width)
        }
        contentView.addSubview(selectedView)
        selectedView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(label.snp.width)
            make.width.equalTo(label.snp.width)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillCellWithData(text: String) {
        label.text = text
        label.numberOfLines = 1
        label.textAlignment = .center
        selectedView.isHidden = true
    }
    
    func setCellSelected() {
        selectedView.isHidden = false
        contentView.sendSubviewToBack(selectedView)
        selectedView.layer.cornerRadius = bounds.width / 2
    }
    
    func setCellDeselected() {
        selectedView.isHidden = true
    }
}


class CustomMonthHeader: JTACMonthReusableView {
    static let reuseId = "DateHeader"
    let label: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "SF Pro Display", size: 16)
        lab.textAlignment = .left
        return lab
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
