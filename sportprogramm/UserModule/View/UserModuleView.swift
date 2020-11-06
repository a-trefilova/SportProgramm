
import UIKit
import SnapKit

extension UserModuleView {
    struct Appearance {
        let exampleOffset: CGFloat = 10
    }
}

class UserModuleView: UIView {
    let appearance = Appearance()

    fileprivate(set) lazy var customView: UIView = {
        let view = UIView()
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
    }

    func makeConstraints() {
    }
}
