//
//  UserSettings module
//  Created by Alyona Sabitskaya on 15/11/2020.
//

protocol UserSettingsBusinessLogic {
    func doSomething(request: UserSettings.Something.Request)
}

/// Класс для описания бизнес-логики модуля UserSettings
class UserSettingsInteractor: UserSettingsBusinessLogic {
    let presenter: UserSettingsPresentationLogic
    let provider: UserSettingsProviderProtocol

    init(presenter: UserSettingsPresentationLogic, provider: UserSettingsProviderProtocol = UserSettingsProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Do something
    func doSomething(request: UserSettings.Something.Request) {
        provider.getItems { (items, error) in
            let result: UserSettings.UserSettingsRequestResult
            if let items = items {
                result = .success(items)
            } else if let error = error {
                result = .failure(.someError(message: error.localizedDescription))
            } else {
                result = .failure(.someError(message: "No Data"))
            }
            self.presenter.presentSomething(response: UserSettings.Something.Response(result: result))
        }
    }
}
