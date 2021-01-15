import UIKit
import SnapKit

class UserDetailedTrainingView: UIView {
    var customView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SF Pro Display", size: 18)
        label.textAlignment = .center
        return label
    }()
    
    var trainingCard: UITableView = {
        let card = UITableView()
        card.backgroundColor = .clear
        return card
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
        customView.addSubview(titleLabel)
        customView.addSubview(trainingCard)
    }
    
    func makeConstraints() {
           customView.snp.makeConstraints { (make) in
               make.edges.equalToSuperview()
           }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(customView.snp.top).offset(50)
            make.centerX.equalTo(customView.snp.centerX)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        trainingCard.snp.makeConstraints { (make) in
            make.top.equalTo(customView.snp.top)
            make.leading.equalTo(customView.snp.leading).offset(16)
            make.trailing.equalTo(customView.snp.trailing).offset(-16)
            make.bottom.equalTo(customView.snp.bottom).offset(-16)
        }
    }
}
