
import Foundation
import UIKit

class DetailedProgrammBuilder {
    
    func build(withProgramm programm: FullProgramm) -> UIViewController {
        let model = programm
        let view = DetailedProgrammViewController()
        let presenter = DetailedProgrammPresenter(model: model, view: view)
        view.presenter = presenter
        return view
    }
}
