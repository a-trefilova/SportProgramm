
import Foundation
import UIKit
import SnapKit

class CustomNavBar: UIView {
    
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()

    
    private var backgroundGradientView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    private var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isItBarForCalendar = false
        createLayout()
        
    }
    
    convenience init(isItCalendar: Bool) {
        self.init()
        isItBarForCalendar = isItCalendar
        createLayout()
    }
    
    var isItBarForCalendar: Bool?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func createLayoutForImage() {
//       let backgroundView = createBackgroundView()
//       createTitleLabelAndDescriptionLabel(onBackgroundView: backgroundView)
//    }
//
//    private func createLayoutForGradient() {
//        let backgroundView = createBackgroundGradient()
//        createTitleLabelAndDescriptionLabel(onBackgroundView: backgroundView)
//    }
    
    private func createLayout() {
       
        if isItBarForCalendar == false {
            addSubview(backgroundGradientView)
            backgroundGradientView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            backgroundImageView = createBackgroundView()
            backgroundGradientView.addSubview(backgroundImageView)
            createTitleLabelAndDescriptionLabel(onBackgroundView: backgroundImageView)
        }
        
        if isItBarForCalendar == true {
            backgroundGradientView = createBackgroundGradient()
            backgroundImageView = UIImageView()
            backgroundGradientView.addSubview(backgroundImageView)
            backgroundImageView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            createTitleLabelAndDescriptionLabel(onBackgroundView: backgroundImageView)
        }
        
       
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
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.clipsToBounds = true
            
            return imageView
        
        
    }
    
    private func createBackgroundGradient() -> UIView {
        let view = GradientWrapperView()
        view.startPoint =  CGPoint(x: 0.25, y: 0.5)
        view.endPoint = CGPoint(x: 0.75, y: 0.5)

        addSubview(view)
        view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.lessThanOrEqualTo(250)
        }
        view.layer.cornerRadius = 8
        layer.cornerRadius = 8
        //layoutSubviews()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }
    
    private func createTitleLabelAndDescriptionLabel(onBackgroundView view: UIView) {
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
        
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "SF Pro Display", size: 24)
        titleLabel.textAlignment = .left
        transparentContainerForTitleAndDescription.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(transparentContainerForTitleAndDescription.snp.top).offset(50)
            make.leading.equalTo(transparentContainerForTitleAndDescription.snp.leading).offset(30)
            make.trailing.equalTo(transparentContainerForTitleAndDescription.snp.trailing).offset(-17)
            make.height.lessThanOrEqualTo(30)
        
        }
        
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: "SF Pro Text", size: 13)
        descriptionLabel.textAlignment = .left
        transparentContainerForTitleAndDescription.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalTo(transparentContainerForTitleAndDescription.snp.leading).offset(30)
            make.trailing.equalTo(transparentContainerForTitleAndDescription.snp.trailing).offset(-17)
            make.bottom.equalTo(transparentContainerForTitleAndDescription.snp.bottom).offset(-26)
        }
        
    }
}


import UIKit

class GradientView: UIView {
    
    var startColor: UIColor? {
        didSet {
            setUpGradienColor()
        }
    }
    var endColor: UIColor?{
        didSet {
            setUpGradienColor()
        }
    }
    
// MARK: - Private Properties
    private let gradientLayer = CAGradientLayer()
    
// MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUPGradient()
    }
    
// MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
  
// MARK: - Private Methods
   private func setUPGradient() {
        self.layer.addSublayer(gradientLayer)
        setUpGradienColor()
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
    }
    
   private func setUpGradienColor() {
        if let startColor = startColor, let endColor = endColor {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
           
        }
    }
    
}


class GradientWrapperView: UIView {
    
    private let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = CGFloat(0.0)
        return layer
    }()
    
    override func draw(_ rect: CGRect) {
        self.layer.addSublayer(gradientLayer)
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = self.startPoint
        gradientLayer.endPoint = self.endPoint
        gradientLayer.colors = self.colors
        gradientLayer.type = self.type
    }
    
    public var colors: [CGColor] = [UIColor(red: 0.137, green: 0.114, blue: 0.086, alpha: 1).cgColor,
                                    UIColor(red: 0.135, green: 0.112, blue: 0.084, alpha: 0.9).cgColor,
                                    UIColor(red: 0.133, green: 0.11, blue: 0.082, alpha: 0.84).cgColor] {
        didSet{
            self.gradientLayer.colors = self.colors
        }
    }
    
    public var startPoint: CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            self.gradientLayer.startPoint = startPoint
        }
    }
    
    public var endPoint: CGPoint = CGPoint(x: 1, y: 0) {
        didSet{
            self.gradientLayer.endPoint = self.endPoint
        }
    }
    
    public var type: CAGradientLayerType = .axial {
        didSet {
            gradientLayer.type = self.type
        }
    }
    
}



class CustomGradientNavbar: UIView {
    
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    var arrayOfDates: [Date]?
    
    private var backgroundGradientView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createLayout()
           
    }
       
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    private func createLayout() {
     
        backgroundGradientView = createBackgroundGradient()
        let view = UIView()
        addSubview(view)
        view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        view.sendSubviewToBack(backgroundGradientView)
        createTitleLabelAndDescriptionLabel(onBackgroundView: view)
 
    }
    
    private func createBackgroundGradient() -> UIView {
        let view = GradientWrapperView()
        view.startPoint =  CGPoint(x: 0.25, y: 0.5)
        view.endPoint = CGPoint(x: 0.75, y: 0.5)

        addSubview(view)
        view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(300)
        }
        view.layer.cornerRadius = 8
        layer.cornerRadius = 8
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }
    
    private func createTitleLabelAndDescriptionLabel(onBackgroundView view: UIView) {
        let transparentContainerForTitleAndDescription = UIView()
        transparentContainerForTitleAndDescription.clipsToBounds = true
        transparentContainerForTitleAndDescription.backgroundColor = .clear
        view.addSubview(transparentContainerForTitleAndDescription)
        transparentContainerForTitleAndDescription.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
             make.leading.equalToSuperview()
             make.trailing.equalToSuperview()
             make.bottom.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "SF Pro Display", size: 24)
        titleLabel.textAlignment = .left
        transparentContainerForTitleAndDescription.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(transparentContainerForTitleAndDescription.snp.top).offset(50)
            make.leading.equalTo(transparentContainerForTitleAndDescription.snp.leading).offset(16)
            make.trailing.equalTo(transparentContainerForTitleAndDescription.snp.trailing).offset(-17)
        
        }
        
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: "SF Pro Text", size: 13)
        descriptionLabel.textAlignment = .left
        transparentContainerForTitleAndDescription.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(18)
            make.leading.equalTo(transparentContainerForTitleAndDescription.snp.leading).offset(16)
            make.trailing.equalTo(transparentContainerForTitleAndDescription.snp.trailing).offset(-17)
          
        }
        
        
        
        let arrayOfDays = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
        var arrayOfViews = [UILabel]()
        for item in arrayOfDays {
            let label = UILabel()
            label.font = UIFont(name: "SF Pro Text", size: 16)
            label.textColor = .white
            label.text = item
            arrayOfViews.append(label)
        }
        let stackView = UIStackView()
        for item in arrayOfViews {
            stackView.addArrangedSubview(item)
        }
        
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        transparentContainerForTitleAndDescription.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(18)
            make.leading.equalTo(transparentContainerForTitleAndDescription.snp.leading).offset(24)
            make.trailing.equalTo(transparentContainerForTitleAndDescription.snp.trailing).offset(-16)
            make.bottom.equalTo(transparentContainerForTitleAndDescription.snp.bottom).offset(-16)
        }
        
    }
}
