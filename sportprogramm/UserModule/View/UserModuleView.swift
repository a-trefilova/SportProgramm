
import UIKit
import SnapKit

extension UserModuleView {
    struct Appearance {
        let exampleOffset: CGFloat = 10
    }
}

class UserModuleView: UIView {
    let appearance = Appearance()

     var customView: UIView = {
        let view = UIView()
        return view
    }()
    
    var label: UILabel = {
        let label = UILabel()
        return label
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
        customView.addSubview(label)
    }

    func makeConstraints() {
        customView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        label.snp.makeConstraints { (make) in
            make.top.equalTo(customView.snp.top)
            make.leading.equalTo(customView.snp.leading)
            make.trailing.equalTo(customView.snp.trailing)
            make.height.greaterThanOrEqualTo(100)
        }
    }
}
