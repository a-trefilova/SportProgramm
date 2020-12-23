import Foundation

struct UserTrainingCalendarModel {

    let uid: Int
    let name: String
    let programm: FullProgramm
    let dictionary: [ProgrammPerDay: Date]
}

extension UserTrainingCalendarModel: Equatable {
    static func == (lhs: UserTrainingCalendarModel, rhs: UserTrainingCalendarModel) -> Bool {
        return lhs.uid == rhs.uid
    }
}


extension ProgrammPerDay: Hashable {
    static func == (lhs: ProgrammPerDay, rhs: ProgrammPerDay) -> Bool {
        if lhs.description == rhs.description, lhs.numberOfDay == rhs.numberOfDay, lhs.numberOfDay == rhs.numberOfDay, lhs.numberOfExercises == rhs.numberOfExercises {
            return true
        }
        return false
    }
    
    func hash(into hasher: inout Hasher) {
        
    }
    
    
}
