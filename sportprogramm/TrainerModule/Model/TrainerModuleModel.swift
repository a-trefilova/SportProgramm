//
//  Created by Alyona Sabitskaya on 27/10/2020.
//

/// Модель данных, описывающая ...
struct TrainerModuleModel {
    // Example
    let uid: Int
    let name: String
}

extension TrainerModuleModel: Equatable {
    static func == (lhs: TrainerModuleModel, rhs: TrainerModuleModel) -> Bool {
        return lhs.uid == rhs.uid
    }
}
