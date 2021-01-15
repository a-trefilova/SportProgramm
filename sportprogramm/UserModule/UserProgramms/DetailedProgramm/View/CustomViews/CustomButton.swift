
import UIKit

class CheckBox: UIButton {
    
    let uncheckedImage = UIImage(systemName: "checkmark.square")! as UIImage
    let checkedImage = UIImage(systemName: "checkmark.square.fill")! as UIImage
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    override init(frame: CGRect) {
       
        super.init(frame: frame)
        self.setImage(uncheckedImage, for: UIControl.State.normal)
        self.imageWith(color: .blue, for: .normal)
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
        
    }
    
    @objc func buttonClicked(sender: UIButton) {
        print("checkbox taped")
            if sender == self {
                isChecked = !isChecked
            }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
