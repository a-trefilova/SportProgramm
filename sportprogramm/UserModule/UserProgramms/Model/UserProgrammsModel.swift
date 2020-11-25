
struct UserProgrammsModel{
    let uid: Int
    let name: String
}

extension UserProgrammsModel: Equatable {
    static func == (lhs: UserProgrammsModel, rhs: UserProgrammsModel) -> Bool {
        return lhs.uid == rhs.uid
    }
}
