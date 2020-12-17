
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
        //layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        //layout.itemSize = CGSize(width: 78, height: 16)
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5)
        layout.itemSize = CGSize(width: 78, height: 50)
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.allowsSelection = true
        return view
    }()
    
//    var scrollInsideContainer: UIScrollView = {
//        let view = UIScrollView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.isScrollEnabled = true
//        view.isPagingEnabled = true
//        view.showsHorizontalScrollIndicator = true
//        view.alwaysBounceHorizontal = true
//        view.bounces = true
//
//        view.backgroundColor = .blue
//        return view
//    }()
//
//    var anotherContainer: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    var numberOfDaysInProgramm: Int = 15
 //   var arrayOfViews = [UIView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        createUIViewForEachDayInProgramm(numberOfDays: numberOfDaysInProgramm)
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func addSubviews() {
        addSubview(customView)
        customView.addSubview(activityIndicator)
        customView.addSubview(containerForTitle)
        customView.addSubview(containerForDays)
//        containerForDays.addSubview(scrollInsideContainer)
//        scrollInsideContainer.addSubview(anotherContainer)
//        for item in arrayOfViews {
//            anotherContainer.addSubview(item)
//        }
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
        
        containerForDays.snp.makeConstraints { (make) in
            make.top.equalTo(customView.snp.top).offset(220)
            make.leading.equalTo(containerForTitle.snp.leading)
            make.trailing.equalTo(containerForTitle.snp.trailing)
            make.height.lessThanOrEqualTo(50)
        }
        
//        scrollInsideContainer.snp.makeConstraints { (make) in
//            make.top.equalTo(containerForDays.snp.top)
//            make.leading.equalTo(containerForDays.snp.leading)
//            make.trailing.equalTo(containerForDays.snp.trailing)
//            make.bottom.equalTo(containerForDays.snp.bottom)
//
//        }
//
//        anotherContainer.snp.makeConstraints { (make) in
//            make.top.equalTo(scrollInsideContainer.snp.top)
//            make.leading.equalTo(scrollInsideContainer.snp.leading)
//            make.trailing.equalTo(scrollInsideContainer.snp.trailing)
//            make.bottom.equalTo(scrollInsideContainer.snp.bottom)
//            make.height.equalTo(scrollInsideContainer.snp.height)
//            make.width.equalTo(scrollInsideContainer.snp.width).priorityLow()
//        }
//
//        scrollInsideContainer.contentSize = CGSize(width: anotherContainer.bounds.width, height: anotherContainer.bounds.height)
//
//        for (index, item) in arrayOfViews.enumerated() {
//            if index == 0 {
//                item.snp.makeConstraints { (make) in
//                    make.top.equalTo(anotherContainer.snp.top)
//                    make.bottom.equalTo(anotherContainer.snp.bottom)
//                    make.leading.equalTo(anotherContainer.snp.leading)
//                }
//            } else {
//                item.snp.makeConstraints { (make) in
//                    make.top.equalTo(anotherContainer.snp.top)
//                    make.bottom.equalTo(anotherContainer.snp.bottom)
//                    make.leading.equalTo(arrayOfViews[index - 1].snp.trailing).offset(15)
//                   // make.trailing.equalTo(arrayOfViews[index + 1].snp.leading)
//                }
//            }
//        }
        
    }
    
    func setUpTitle(title: String, description: String) {
        
        containerForTitle.titleLabel.text = title
        containerForTitle.descriptionLabel.text = description
        setNeedsDisplay()
        setNeedsLayout()
        setNeedsUpdateConstraints()
    }
    
//    private func createUIViewForEachDayInProgramm(numberOfDays: Int) {
//       // var arrayOfViews = [UIView]()
//        for i in 1...numberOfDays {
//            let view = UIView()
//            view.backgroundColor = .cyan
//            let label = UILabel()
//            label.text = "День \(i)"
//            view.addSubview(label)
//            label.snp.makeConstraints { (make) in
//                make.top.equalTo(view.snp.top)
//                make.leading.equalTo(view.snp.leading)
//                make.trailing.equalTo(view.snp.trailing)
//                make.bottom.equalTo(view.snp.bottom)
//            }
//            arrayOfViews.append(view)
//        }
//
//    }
}


class CustomNavBar: UIView {
    
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        createLayout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLayout() {
       let backgroundView = createBackgroundView()
       createTitleLabelAndDescriptionLabel(onBackgroundView: backgroundView)
    }
    
    private func createBackgroundView() -> UIImageView {
        let image = UIImage(named: "backgroundNavBar")
        let imageView = UIImageView(image: image)
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        imageView.layer.cornerRadius = 8
        layer.cornerRadius = 8
        return imageView
    }
    
    private func createTitleLabelAndDescriptionLabel(onBackgroundView view: UIImageView) {
        let transparentContainerForTitleAndDescription = UIView()
        transparentContainerForTitleAndDescription.clipsToBounds = true
        transparentContainerForTitleAndDescription.backgroundColor = .clear
        view.addSubview(transparentContainerForTitleAndDescription)
        transparentContainerForTitleAndDescription.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
             make.leading.equalToSuperview()
             make.trailing.equalToSuperview()
             make.bottom.equalToSuperview()
        }
        
        //let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont(name: "SF Pro Display", size: 24)
        titleLabel.textAlignment = .left
        //titleLabel.text = titleOfPage
        transparentContainerForTitleAndDescription.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(transparentContainerForTitleAndDescription.snp.top).offset(50)
            make.leading.equalTo(transparentContainerForTitleAndDescription.snp.leading).offset(16)
            make.trailing.equalTo(transparentContainerForTitleAndDescription.snp.trailing).offset(-17)
            make.height.lessThanOrEqualTo(30)
        
        }
        
       // let descriptionLabel = UILabel()
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: "SF Pro Text", size: 13)
        descriptionLabel.textAlignment = .left
        //descriptionLabel.text = descriptionOfPage
        transparentContainerForTitleAndDescription.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalTo(transparentContainerForTitleAndDescription.snp.leading).offset(16)
            make.trailing.equalTo(transparentContainerForTitleAndDescription.snp.trailing).offset(-17)
            make.bottom.equalTo(transparentContainerForTitleAndDescription.snp.bottom).offset(-26)
        }
        
    }
}


class CustomCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "CustomCollectionCell"
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SF Pro Display", size: 16)
        label.numberOfLines = 1
        label.textColor = UIColor(red: 198, green: 198, blue: 198, alpha: 1)
        return label
    }()
    let underLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillCellFithData(numberOfWeek: Int) {
        contentView.addSubview(titleLabel)
        contentView.addSubview(underLine)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        underLine.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        contentView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        titleLabel.textAlignment = .center
        titleLabel.text = "Неделя " + String(describing: numberOfWeek)
        underLine.isHidden = true
    }
    
}
