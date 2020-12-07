
struct UserProgrammsModel{
    let uid: Int
    let email: String
    let name: String
    let userProgramms: [FullProgramm]
}

extension UserProgrammsModel: Equatable {
    static func == (lhs: UserProgrammsModel, rhs: UserProgrammsModel) -> Bool {
        return lhs.uid == rhs.uid
    }
}


struct FullProgramm {
    var title: String
    var numberOfWeeks: Int
    var excersicesByDay: [ProgrammPerDay]
}

struct ProgrammPerDay {
    var titleOfDay: String
    var numberOfExercises: Int
    var description: String
    var exercises: [Excersice]
}

struct Excersice {
    var title: String
    var description: String
    var numberOfSets: Int
    var numberOfReps: Int
    var weight: Int
    var isSuperset: Bool
    
}
