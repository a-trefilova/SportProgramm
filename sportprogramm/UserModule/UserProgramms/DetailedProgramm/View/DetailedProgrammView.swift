
import UIKit
import SnapKit

class DetailedProgrammView: UIView {

    var customView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        return view
    }()
    
    var containerForTitle: UIView = {
       let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        makeConstraints()
        setUpTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(customView)
        customView.addSubview(activityIndicator)
        customView.addSubview(containerForTitle)
    }
    
    func makeConstraints() {
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
            make.height.lessThanOrEqualTo(180)
        }
        
        
    }
    
   private func setUpTitle() {
        
        let imageBcTitle = UIImage(named: "backgroundNavBar")
        let imageView = UIImageView(image: imageBcTitle)
        containerForTitle.addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        containerForTitle.layer.cornerRadius = 8
        imageView.layer.cornerRadius = 8
    }
}
