//
//  Created by Alyona Sabitskaya on 27/10/2020.
//

/// Модель данных, описывающая ...
struct authModuleModel: UniqueIdentifiable {
    // Example
    let uid: UniqueIdentifier
    let name: String
}

extension authModuleModel: Equatable {
    static func == (lhs: authModuleModel, rhs: authModuleModel) -> Bool {
        return lhs.uid == rhs.uid
    }
}
