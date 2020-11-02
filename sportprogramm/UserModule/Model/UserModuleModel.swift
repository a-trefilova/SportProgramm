//
//  Created by Alyona Sabitskaya on 27/10/2020.
//

/// Модель данных, описывающая ...
struct UserModuleModel{
    // Example
    let uid: Int
    let name: String
}

extension UserModuleModel: Equatable {
    static func == (lhs: UserModuleModel, rhs: UserModuleModel) -> Bool {
        return lhs.uid == rhs.uid
    }
}
