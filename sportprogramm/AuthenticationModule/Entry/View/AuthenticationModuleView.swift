//
//  Created by Alyona Sabitskaya on 27/10/2020.
//

import UIKit
import  SnapKit
extension AuthenticationModuleView {
    struct Appearance {
        let exampleOffset: CGFloat = 10
    }
}

class AuthenticationModuleView: UIView {
    
    let widthOfTextField = UIScreen.main.bounds.width * 0.7
    
    let titleContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    let titleLabel: UILabel = {
         let label = UILabel()
         label.text = "Вход"
         label.setBoldDisplayTitle(bySize: 34)
         label.numberOfLines = 1
         return label
     }()
    
     let descriptionLabel: UILabel = {
         let label = UILabel()
         label.text = "Добро пожаловать! \nВойдите, чтобы продолжить"
         label.setTextTitle(bySize: 17)
         label.textAlignment = .center
         label.numberOfLines = 2
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     
    let tfContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
     
     let emailTextField: UITextField = {
         let tf = UITextField()
         tf.placeholder = "Email"
         tf.textContentType = .emailAddress
        tf.minimumFontSize = 16
        tf.borderStyle = .none
         return tf
     }()
     
     let passwordTextField: UITextField = {
         let tf = UITextField()
         tf.placeholder = "Пароль"
        tf.minimumFontSize = 16
        tf.borderStyle = .none
         return tf
     }()
    
    let forgotLabel: UILabel = {
        let label = UILabel()
        label.text = "Забыли пароль?"
        label.setTextTitle(bySize: 13)
        label.textColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    let bottomContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), for: .selected)

        return button
    }()
    
    let lineOne: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.3)
        return view
    }()
    
    let lineTwo: UIView = {
        let view = UIView()
        view.frame.size = CGSize(width: UIScreen.main.bounds.width, height: 1.0)
        view.backgroundColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.3)
        return view
    }()
    
     override init(frame: CGRect) {
         super.init(frame: frame)
         backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
         
         addSubviews()
         makeConstraints()
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
   
     
     func addSubviews() {
        addSubview(titleContainer)
        titleContainer.addSubview(titleLabel)
        titleContainer.addSubview(descriptionLabel)
        
        addSubview(tfContainer)
       tfContainer.addSubview(emailTextField)
        emailTextField.addSubview(lineOne)
       tfContainer.addSubview(passwordTextField)
        passwordTextField.addSubview(lineTwo)
        passwordTextField.addSubview(forgotLabel)
        
        addSubview(bottomContainer)
       bottomContainer.addSubview(loginButton)
     }
     
     func makeConstraints() {
        
        titleContainer.snp.makeConstraints { (make) in
            //guard let view = superview else { return }
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.lessThanOrEqualTo(UIScreen.main.bounds.height / 3)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.lessThanOrEqualTo(titleContainer.snp.top).offset(171)
            make.centerX.equalTo(titleContainer.snp.centerX)
            make.bottom.equalTo(descriptionLabel.snp.top).offset(-16)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            //make.leading.equalTo
            make.centerX.equalTo(titleContainer.snp.centerX)
            make.bottom.equalTo(titleContainer.snp.bottom).inset(10)
        }
         
         
        tfContainer.snp.makeConstraints { (make) in
            make.top.equalTo(titleContainer.snp.bottom).offset(40)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset((UIScreen.main.bounds.height / 2))
            //make.height.greaterThanOrEqualTo(150)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(tfContainer.snp.top)
            //make.width.equalTo(widthOfTextField)
            make.leading.equalTo(tfContainer.snp.leading).offset(16)
            make.trailing.equalTo(tfContainer.snp.trailing).offset(-16)
            make.height.equalTo((UIScreen.main.bounds.height / 3) / 5 )
            
            
        }
        
        lineOne.snp.makeConstraints { (make) in
            make.bottom.equalTo(emailTextField.snp.bottom)
            make.leading.equalTo(emailTextField.snp.leading)
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.height.equalTo(1)
            make.width.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom)
            //make.width.equalTo(widthOfTextField)
            make.leading.equalTo(tfContainer.snp.leading).offset(16)
            make.trailing.equalTo(tfContainer.snp.trailing).offset(-16)
            make.height.equalTo((UIScreen.main.bounds.height / 3) / 5 )
            //make.bottom.equalTo(tfContainer.snp.bottom)
            
            
        }
        
        forgotLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(passwordTextField.snp.trailing).offset(-16)
            make.bottom.equalTo(passwordTextField.snp.bottom).offset(-20)
        }
        
        lineTwo.snp.makeConstraints { (make) in
            make.bottom.equalTo(passwordTextField.snp.bottom)
            make.leading.equalTo(passwordTextField.snp.leading)
            make.trailing.equalTo(passwordTextField.snp.trailing)
            make.height.equalTo(1)
            make.width.equalToSuperview()
        }
         
        bottomContainer.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset((UIScreen.main.bounds.height / 4)*3)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        loginButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalTo(tfContainer.snp.centerX)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(16)
            make.height.equalTo((UIScreen.main.bounds.height / 3) / 5)
        }
     }
     
}

extension UILabel {
    func setCompactRoundedFont(bySize: CGFloat, weight: weightOfSFCompactRounded) -> UIFont? {
        return UIFont(name: "SFCompactRounded-\(weight)", size: bySize)
    }
    
    func setBoldDisplayTitle(bySize: CGFloat) {
        let label = self
        label.font = UIFont(name: "SF Pro Display", size: bySize)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        
        let attributesString = NSMutableAttributedString(string: label.text!, attributes: [NSAttributedString.Key.kern : 0.37,
            NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.attributedText = attributesString
    }
    
    func setTextTitle(bySize: CGFloat) {
        let label = self
        label.font = UIFont(name: "SF Pro Text", size: bySize)
        label.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        
        let attributesString = NSMutableAttributedString(string: label.text!, attributes: [NSAttributedString.Key.kern : -0.41,
            NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.attributedText = attributesString
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

struct OffsetsForEntryScreen {
    let smallOffset: CGFloat = 16.0
    let defaultOffset = 32.0
    let biggestOffset = 40.0
    let offsetFromScreen = 171.0
    
}

