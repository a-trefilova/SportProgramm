
struct UserModuleModel{
    let uid: Int
    let userProgramms: [FullProgramm]
}

extension UserModuleModel: Equatable {
    static func == (lhs: UserModuleModel, rhs: UserModuleModel) -> Bool {
        return lhs.uid == rhs.uid
    }
}
