//
//  authModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

protocol authModuleBusinessLogic {
    func doSomething(request: authModule.Something.Request)
}

/// Класс для описания бизнес-логики модуля authModule
class authModuleInteractor: authModuleBusinessLogic {
    let presenter: authModulePresentationLogic
    let provider: authModuleProviderProtocol

    init(presenter: authModulePresentationLogic, provider: authModuleProviderProtocol = authModuleProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Do something
    func doSomething(request: authModule.Something.Request) {
        provider.getItems { (items, error) in
            let result: authModule.authModuleRequestResult
            if let items = items {
                result = .success(items)
            } else if let error = error {
                result = .failure(.someError(message: error.localizedDescription))
            } else {
                result = .failure(.someError(message: "No Data"))
            }
            self.presenter.presentSomething(response: authModule.Something.Response(result: result))
        }
    }
}
