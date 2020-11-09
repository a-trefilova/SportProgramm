
import UIKit
import SnapKit

extension RegistrationView {
    struct Appearance {
        let exampleOffset: CGFloat = 10
    }
}

class RegistrationView: UIView {
    let appearance = Appearance()
    
    let titleContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()

    let titleLabel: UILabel = {
         let label = UILabel()
         label.text = "Регистрация"
         label.setBoldDisplayTitle(bySize: 34)
         label.numberOfLines = 1
         return label
     }()

     let descriptionLabel: UILabel = {
         let label = UILabel()
         label.text = "Зарегистрируйтесь чтобы получить \nдоступ к приложению"
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
    
    let emailTf = customTextField(placeholderValue: "Email", frame: CGRect.zero)
    let nameTf = customTextField(placeholderValue: "Имя", frame: CGRect.zero)
    let passwordTf = customTextField(placeholderValue: "Пароль", frame: CGRect.zero)
    
    let checkboxContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    let checkBox: UIButton = {
        let box = UIButton()
        return box
    }()
    
    let applyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont(name: "SF Pro Display", size: 15)
        return label
    }()
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setUpCheckBox()
        addSubviews()
        makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCheckBox() {
        checkBox.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        checkBox.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        let policy = "Политику конфиденциальности"
        let usage = "Условия использования"
        let string = NSAttributedString(string: "Я принимаю \(policy) и \(usage)")
        let attrSting = NSMutableAttributedString(attributedString: string)
        attrSting.setAttributes([NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)], range: NSRange(location: 11, length: policy.count))
        attrSting.setAttributes([NSAttributedString.Key.kern : 0.37], range: NSRange(location: 11, length: policy.count))
        attrSting.setAttributes([NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)], range: NSRange(location: 41, length: usage.count))
        attrSting.setAttributes([NSAttributedString.Key.kern : 0.37], range: NSRange(location: 41, length: usage.count))
//        attrSting.setAttributes([NSAttributedString.Key.font : UIFont(name: "SF Pro Display", size: 15)], range: NSRange(location: 0, length: string.length))
        applyLabel.attributedText = attrSting
        //applyLabel.font = UIFont(name: "SF Pro Display", size: 15)
        applyLabel.textAlignment = .left
    }

    func addSubviews(){
        addSubview(titleContainer)
        titleContainer.addSubview(titleLabel)
        titleContainer.addSubview(descriptionLabel)
        
        addSubview(tfContainer)
        tfContainer.addSubview(emailTf)
        tfContainer.addSubview(nameTf)
        tfContainer.addSubview(passwordTf)
        
        tfContainer.addSubview(checkboxContainer)
        checkboxContainer.addSubview(checkBox)
        checkboxContainer.addSubview(applyLabel)
    }

    func makeConstraints() {
        titleContainer.snp.makeConstraints { (make) in
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
            make.height.lessThanOrEqualTo(UIScreen.main.bounds.height / 3)
        }
        nameTf.snp.makeConstraints { (make) in
            make.top.equalTo(tfContainer.snp.top)
            make.leading.equalTo(tfContainer.snp.leading).offset(16)
            make.trailing.equalTo(tfContainer.snp.trailing).offset(-16)
            make.height.equalTo((UIScreen.main.bounds.height / 3) / 5 )
        }
        
        emailTf.snp.makeConstraints { (make) in
            make.top.equalTo(nameTf.snp.bottom)
            make.leading.equalTo(tfContainer.snp.leading).offset(16)
            make.trailing.equalTo(tfContainer.snp.trailing).offset(-16)
            make.height.equalTo((UIScreen.main.bounds.height / 3) / 5 )
        }
        
        passwordTf.snp.makeConstraints { (make) in
            make.top.equalTo(emailTf.snp.bottom)
            make.leading.equalTo(tfContainer.snp.leading).offset(16)
            make.trailing.equalTo(tfContainer.snp.trailing).offset(-16)
            make.height.equalTo((UIScreen.main.bounds.height / 3) / 5 )
        }
        
        checkboxContainer.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTf.snp.bottom).offset(5)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.lessThanOrEqualTo((UIScreen.main.bounds.height / 3) / 5 )
        }
        
        checkBox.snp.makeConstraints { (make) in
            make.leading.equalTo(checkboxContainer.snp.leading).offset(16)
            make.centerY.equalTo(checkboxContainer.snp.centerY)
            make.height.lessThanOrEqualTo(20)
            make.width.lessThanOrEqualTo(20)
        }
        
        applyLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(checkBox.snp.trailing).offset(5)
            make.centerY.equalTo(checkboxContainer.snp.centerY)
            make.trailing.equalTo(checkboxContainer.snp.trailing).offset(-16)
            
        }
    }
}



class customTextField: UITextField {
    
    var placeholderValue: String?
    
    let lineOne: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.3)
        return view
    }()
    
    init(placeholderValue: String, frame: CGRect) {
        self.placeholderValue = placeholderValue
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textAlignment = .left
        setUpTF()
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpTF() {
        minimumFontSize = 16
        placeholder = placeholderValue
        borderStyle = .none
    }
    
    func addSubviews() {
        addSubview(lineOne)
        
    }

    func makeConstraints() {
        lineOne.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(1)
            make.width.equalToSuperview()
        }
    }
}
