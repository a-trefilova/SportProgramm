
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
    
    var containerForTitle: CustomNavBar = {
           let view = CustomNavBar()
           view.clipsToBounds = true
           return view
       
       }()
    
    var calendarView: JTACMonthView = {
        let view = JTACMonthView()
        view.backgroundColor = .white
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
    func fillCellWithData(text: String) {
        label.text = text
        contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        label.numberOfLines = 1
    }
    
}
