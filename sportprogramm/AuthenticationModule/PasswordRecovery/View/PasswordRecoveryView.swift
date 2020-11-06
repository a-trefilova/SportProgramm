//
//  Created by Alyona Sabitskaya on 06/11/2020.
//

import UIKit
import SnapKit

extension PasswordRecoveryView {
    struct Appearance {
        let exampleOffset: CGFloat = 10
    }
}

class PasswordRecoveryView: UIView {
    let appearance = Appearance()

    let titleContainer: UIView = {
           let view = UIView()
           view.clipsToBounds = true
           return view
       }()
       
       let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Забыли пароль?"
            label.setBoldDisplayTitle(bySize: 34)
            label.numberOfLines = 1
            return label
        }()
       
        let descriptionLabel: UILabel = {
            let label = UILabel()
            label.text = "Укажите ваш Email и мы отправим на него ссылку на восстановление пароля"
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
    
    let lineOne: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.3)
        return view
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Продолжить", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), for: .selected)

        return button
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
        addSubview(titleContainer)
         titleContainer.addSubview(titleLabel)
         titleContainer.addSubview(descriptionLabel)
         
         addSubview(tfContainer)
        tfContainer.addSubview(emailTextField)
         emailTextField.addSubview(lineOne)
        
        addSubview(loginButton)
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
            make.leading.equalTo(titleContainer.snp.leading).offset(16)
            make.trailing.equalTo(titleContainer.snp.trailing).offset(-16)
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

        loginButton.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo((UIScreen.main.bounds.height / 3) / 5)
            make.bottom.equalToSuperview().offset(-53)
        }
    }
}
