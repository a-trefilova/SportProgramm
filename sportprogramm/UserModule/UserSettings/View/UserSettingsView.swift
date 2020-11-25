//
//  Created by Alyona Sabitskaya on 15/11/2020.
//

import UIKit

extension UserSettingsView {
    struct Appearance {
        let exampleOffset: CGFloat = 10
    }
}

class UserSettingsView: UIView {
    let appearance = Appearance()

    fileprivate(set) lazy var customView: UIView = {
        let view = UIView()
        return view
    }()

    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
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
