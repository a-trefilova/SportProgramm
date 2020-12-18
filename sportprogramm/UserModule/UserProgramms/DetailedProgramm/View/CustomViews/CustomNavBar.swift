
import Foundation
import UIKit
import SnapKit

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
        
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont(name: "SF Pro Display", size: 24)
        titleLabel.textAlignment = .left
        transparentContainerForTitleAndDescription.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(transparentContainerForTitleAndDescription.snp.top).offset(50)
            make.leading.equalTo(transparentContainerForTitleAndDescription.snp.leading).offset(16)
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
            make.leading.equalTo(transparentContainerForTitleAndDescription.snp.leading).offset(16)
            make.trailing.equalTo(transparentContainerForTitleAndDescription.snp.trailing).offset(-17)
            make.bottom.equalTo(transparentContainerForTitleAndDescription.snp.bottom).offset(-26)
        }
        
    }
}

