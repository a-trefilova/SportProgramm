import Firebase

protocol RegistrationServiceProtocol {
    func fetchItems(completion: @escaping ([RegistrationModel]?, Error?) -> Void)
    func createNewUser(dataModel: RegistrationModel,  completion: @escaping ([RegistrationModel]?, Error?) -> Void)
}


class RegistrationService: RegistrationServiceProtocol {

    var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    
    func fetchItems(completion: @escaping ([RegistrationModel]?, Error?) -> Void) {
        completion(nil, nil)
        //createNewUser(byName: <#T##String#>, email: <#T##String#>, password: <#T##String#>)
    }
    
    func createNewUser(dataModel: RegistrationModel,  completion: @escaping ([RegistrationModel]?, Error?) -> Void) {
        ref = db.collection("users").addDocument(data: ["email": dataModel.email,
                                                        "name": dataModel.name,
                                                        "password": dataModel.password ], completion: { (error) in
                        
        })
        
       // ref = db.collection("userprogramms").co
        
        completion([dataModel], nil)
    }
    
    
    
}
