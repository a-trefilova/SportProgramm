import Firebase

protocol AuthenticationModuleServiceProtocol {
    func fetchItems(completion: @escaping ([AuthenticationModuleModel]?, Error?) -> Void)
    func authenticate(by email: String, password: String, completion: @escaping ([AuthenticationModuleModel]?, Error?) -> Void)
}


class AuthenticationModuleService: AuthenticationModuleServiceProtocol {

    var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    
    func fetchItems(completion: @escaping ([AuthenticationModuleModel]?, Error?) -> Void) {
        completion(nil, nil)
    }
    
    func authenticate(by email: String, password: String, completion: @escaping ([AuthenticationModuleModel]?, Error?) -> Void) {
        checkIfUserIsExists(by: email, password: password) { (bool) in
            if bool {
                let model = AuthenticationModuleModel(email: email, phoneNumber: nil, password: password)
                completion([model], nil)
                return
                
            } else {
//                let error = AuthenticationModuleProviderError.getItemsFailed(underlyingError: Error.self as! Error)
                completion(nil, nil)
            }
        }

    }
    
    
    func createNewUser(by email: String, password: String) {
        ref = db.collection("users").addDocument(data: ["email": email,
                                                        "password": password,
                                                        "phone": "+00000000000"], completion: { (error) in
                        
        })
    }
    
    func checkIfUserIsExists(by email: String, password: String, completion: @escaping (Bool) -> Void){
        db.collection("users").getDocuments { (querySnapshot, error) in
            if let error = error {
                completion(false)
            } else {
                for document in querySnapshot!.documents {
                    let docEmail = document.data()["email"] as! String
                    if email == docEmail {
                        print("User is already exists")
                        completion(true)
                    } else {
                        completion(false)
                    }
                    
                }
            }
            
        }
    }
}
