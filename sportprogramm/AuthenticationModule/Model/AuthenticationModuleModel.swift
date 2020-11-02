
struct AuthenticationModuleModel  {
    let email: String?
    let phoneNumber: String?
    let password: String
}

extension AuthenticationModuleModel: Equatable {
    static func == (lhs: AuthenticationModuleModel, rhs: AuthenticationModuleModel) -> Bool {
        return lhs.password == rhs.password
    }
}

