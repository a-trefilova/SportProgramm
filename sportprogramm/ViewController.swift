

import UIKit

class ViewController: UIViewController {

    private var rootView: LoginView? {
        return view as? LoginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //setupConstraints()
    }
    
    override func loadView() {
        view = LoginView(frame: UIScreen.main.bounds)
    }
    
//    private func setupConstraints() {
//        rootView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        rootView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        rootView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        rootView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
//
//    }
}



extension UILabel {
    func setFont(bySize: CGFloat, weight: weightOfSFCompactRounded) -> UIFont? {
        return UIFont(name: "SFCompactRounded-\(weight)", size: bySize)
    }
}

enum weightOfSFCompactRounded: String {
    case medium = "Medium"
    case black = "Black"
    case heavy = "Heavy"
    case light = "Light"
    case regular = "Regular"
    case semibold = "Semibold"
    case thin = "Thin"
    case ultralight = "Ultralight"
}
