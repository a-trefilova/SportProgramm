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
         label.text = "Sport Programm"
         label.font = label.setFont(bySize: 35, weight: .heavy)
         label.numberOfLines = 1
         return label
     }()
    
     let descriptionLabel: UILabel = {
         let label = UILabel()
         label.text = "Enter your nickname or phonenumber"
         label.font = label.setFont(bySize: 20, weight: .regular)
         label.numberOfLines = 0
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
        tf.borderStyle = .roundedRect
         return tf
     }()
     
     let passwordTextField: UITextField = {
         let tf = UITextField()
         tf.placeholder = "password"
        tf.minimumFontSize = 16
        tf.borderStyle = .roundedRect
         return tf
     }()
     
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), for: .selected)

        return button
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
       tfContainer.addSubview(passwordTextField)
       tfContainer.addSubview(loginButton)
     }
     
     func makeConstraints() {
        
        titleContainer.snp.makeConstraints { (make) in
            //guard let view = superview else { return }
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.greaterThanOrEqualTo(150)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleContainer.snp.top).offset(40)
            make.centerX.equalTo(titleContainer.snp.centerX)
            make.bottom.equalTo(descriptionLabel.snp.top).offset(-60)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(titleContainer.snp.centerX)
            make.bottom.equalTo(titleContainer.snp.bottom).inset(10)
        }
         
         
        tfContainer.snp.makeConstraints { (make) in
            make.top.equalTo(titleContainer.snp.bottom).offset(50)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(UIScreen.main.bounds.height / 3)
            //make.height.greaterThanOrEqualTo(150)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.width.equalTo(widthOfTextField)
            make.centerX.equalTo(tfContainer.snp.centerX)
            make.height.equalTo((UIScreen.main.bounds.height / 3) / 5 )
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom)
            make.width.equalTo(widthOfTextField)
            make.centerX.equalTo(tfContainer.snp.centerX)
            make.height.equalTo((UIScreen.main.bounds.height / 3) / 5 )
            //make.bottom.equalTo(tfContainer.snp.bottom)
        }
         
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.centerX.equalTo(tfContainer.snp.centerX)
            make.width.equalTo(widthOfTextField)
            make.height.equalTo((UIScreen.main.bounds.height / 3) / 5)
        }
     }
     
}
