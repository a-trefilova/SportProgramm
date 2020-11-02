//
//  Created by Alyona Sabitskaya on 27/10/2020.
//

import UIKit

extension TrainerModuleView {
    struct Appearance {
        let exampleOffset: CGFloat = 10
    }
}

class TrainerModuleView: UIView {
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
