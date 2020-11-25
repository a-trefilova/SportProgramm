
struct UserSettingsModel {
    
    let uid: Int
    let name: String
}

extension UserSettingsModel: Equatable {
    static func == (lhs: UserSettingsModel, rhs: UserSettingsModel) -> Bool {
        return lhs.uid == rhs.uid
    }
}
