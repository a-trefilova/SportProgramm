//
//  TrainerModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

protocol TrainerModuleBusinessLogic {
    func doSomething(request: TrainerModule.Something.Request)
}

/// Класс для описания бизнес-логики модуля TrainerModule
class TrainerModuleInteractor: TrainerModuleBusinessLogic {
    let presenter: TrainerModulePresentationLogic
    let provider: TrainerModuleProviderProtocol

    init(presenter: TrainerModulePresentationLogic, provider: TrainerModuleProviderProtocol = TrainerModuleProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Do something
    func doSomething(request: TrainerModule.Something.Request) {
        provider.getItems { (items, error) in
            let result: TrainerModule.TrainerModuleRequestResult
            if let items = items {
                result = .success(items)
            } else if let error = error {
                result = .failure(.someError(message: error.localizedDescription))
            } else {
                result = .failure(.someError(message: "No Data"))
            }
            self.presenter.presentSomething(response: TrainerModule.Something.Response(result: result))
        }
    }
}
