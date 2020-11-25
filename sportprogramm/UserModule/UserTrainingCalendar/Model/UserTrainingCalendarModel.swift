
struct UserTrainingCalendarModel {

    let uid: Int
    let name: String
}

extension UserTrainingCalendarModel: Equatable {
    static func == (lhs: UserTrainingCalendarModel, rhs: UserTrainingCalendarModel) -> Bool {
        return lhs.uid == rhs.uid
    }
}
