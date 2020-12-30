
import UIKit
import SnapKit

class DetailedProgrammView: UIView {

    var customView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        return view
    }()
    
    var containerForTitle: CustomNavBar = {
        let view = CustomNavBar()
        view.clipsToBounds = true
        return view
    
    }()
  
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        return indicator
    }()
    

    var containerForDays : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5)
        layout.itemSize = CGSize(width: 78, height: 50)
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.allowsSelection = true
        return view
    }()
    
    var containerForWeekdays: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 32
        view.distribution = .fillProportionally
        return view
    }()
    
    var arrayOfWeekdayLabels: [UILabel] = [UILabel]()
    
    var headerView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        return view
    }()
    
    var containerForTrainings: UITableView = {
        let  view = UITableView()
        view.separatorStyle = .none
        view.separatorInset = UIEdgeInsets(top: 14, left: 0, bottom: 14, right: 0)
        view.backgroundColor = .clear
        return view
    }()
    
    var planButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.tintColor = .white
        button.setTitle( "Запланировать", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        fillArrayOfWeekdayLabels()
        addSubviews()
        makeConstraints()
    }
    
    private func fillArrayOfWeekdayLabels() {
        let arrayOfDays = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
        for item in arrayOfDays {
            let label = UILabel()
            label.font = UIFont(name: "SF Pro Text", size: 16)
            label.text = item
            arrayOfWeekdayLabels.append(label)
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func addSubviews() {
        addSubview(customView)
        customView.addSubview(activityIndicator)
        customView.addSubview(containerForTitle)
        customView.addSubview(headerView)
        customView.addSubview(containerForTrainings)
        customView.addSubview(planButton)
        planButton.layer.cornerRadius = 14
        customView.sendSubviewToBack(containerForTrainings)
        containerForTrainings.tableHeaderView = headerView
        headerView.addSubview(containerForDays)
        headerView.addSubview(containerForWeekdays)
        for item in arrayOfWeekdayLabels {
            containerForWeekdays.addArrangedSubview(item)
        }
    }
    
    private func makeConstraints() {
        customView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { (make) in
            make.centerX.equalTo(customView.snp.centerX)
            make.centerY.equalTo(customView.snp.centerY)
        }
        
        containerForTitle.snp.makeConstraints { (make) in
            make.top.equalTo(customView.snp.top)
            make.leading.equalTo(customView.snp.leading)
            make.trailing.equalTo(customView.snp.trailing)
            make.height.lessThanOrEqualTo(200)
        }
         
        headerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(customView.snp.leading)
            make.trailing.equalTo(customView.snp.trailing)
            make.height.lessThanOrEqualTo(60)
        }

        
        containerForTrainings.snp.makeConstraints { (make) in
            make.top.equalTo(containerForTitle.snp.bottom)
            make.leading.equalTo(customView.snp.leading).offset(14)
            make.trailing.equalTo(customView.snp.trailing).offset(-14)
            make.bottom.equalToSuperview()
        }
        
        containerForDays.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(customView.snp.leading)
            make.trailing.equalTo(customView.snp.trailing)
            make.height.lessThanOrEqualTo(80)
        }
        
        containerForWeekdays.snp.makeConstraints { (make) in
            make.top.equalTo(containerForDays.snp.bottom)
            make.leading.equalTo(customView.snp.leading).offset(16)
            make.trailing.equalTo(customView.snp.trailing).offset(-16)
            make.bottom.equalToSuperview()
        }
        
        planButton.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().inset(14)
            make.height.equalTo(56)
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




