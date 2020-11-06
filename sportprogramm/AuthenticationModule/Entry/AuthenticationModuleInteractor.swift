
protocol AuthenticationModuleBusinessLogic {
    func doSomething(request: AuthenticationModule.Something.Request)
    func connectWithFirestore(request: AuthenticationModule.Something.FirestoreRequest)
}

class AuthenticationModuleInteractor: AuthenticationModuleBusinessLogic {
    let presenter: AuthenticationModulePresentationLogic
    let provider: AuthenticationModuleProviderProtocol

    init(presenter: AuthenticationModulePresentationLogic, provider: AuthenticationModuleProviderProtocol = AuthenticationModuleProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Do something
    func doSomething(request: AuthenticationModule.Something.Request) {
        provider.getItems { (items, error) in
            let result: AuthenticationModule.AuthenticationModuleRequestResult
            if let items = items {
                result = .success(items)
            } else if let error = error {
                result = .failure(.someError(message: error.localizedDescription))
            } else {
                result = .failure(.someError(message: "No Data"))
            }
            self.presenter.presentSomething(response: AuthenticationModule.Something.Response(result: result))
        }
    }
    
    func connectWithFirestore(request: AuthenticationModule.Something.FirestoreRequest) {
        provider.getRequestFromFb(by: request.email, password: request.password) { (items, error) in
            let result: AuthenticationModule.AuthenticationModuleRequestResult
            if let items = items {
                result = .success(items)
            } else if let error = error {
                result = .failure(.someError(message: error.localizedDescription))
            } else {
                result = .failure(.someError(message: "No Data"))
            }
            self.presenter.presentSomething(response: AuthenticationModule.Something.Response(result: result))
        }
        
    }
    
}
