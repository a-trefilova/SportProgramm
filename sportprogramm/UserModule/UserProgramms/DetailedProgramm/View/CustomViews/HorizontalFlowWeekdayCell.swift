
import Foundation
import UIKit
import SnapKit

class HorizontalFlowWeekdayCell: UICollectionViewCell {
    
    static let reuseId = "CustomCollectionCell"
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SF Pro Display", size: 16)
        label.numberOfLines = 1
        label.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
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
    
    
    override func prepareForReuse() {
        underLine.isHidden = true
        titleLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
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
