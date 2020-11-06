
struct PasswordRecoveryModel {
    // Example
    let uid: Int
    let name: String
}

extension PasswordRecoveryModel: Equatable {
    static func == (lhs: PasswordRecoveryModel, rhs: PasswordRecoveryModel) -> Bool {
        return lhs.uid == rhs.uid
    }
}
