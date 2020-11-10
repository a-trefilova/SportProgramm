
struct RegistrationModel{
    
    let uid: Int
    let name: String
    let email: String
    let password: String
}

extension RegistrationModel: Equatable {
    static func == (lhs: RegistrationModel, rhs: RegistrationModel) -> Bool {
        return lhs.uid == rhs.uid
    }
}
