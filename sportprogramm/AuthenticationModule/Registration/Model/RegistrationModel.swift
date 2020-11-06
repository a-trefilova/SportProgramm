
struct RegistrationModel{
    // Example
    let uid: Int
    let name: String
}

extension RegistrationModel: Equatable {
    static func == (lhs: RegistrationModel, rhs: RegistrationModel) -> Bool {
        return lhs.uid == rhs.uid
    }
}
