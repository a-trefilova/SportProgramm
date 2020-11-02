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
        checkIfUserIsAlreadyExists(by: email, password: password) { (bool) in
            if bool {
                //db.collection("programms").getDocuments
                //{ completion(user, programm, error?)
                //}
            }
        }
            
        createNewUser(by: email, password: password)
        let model = AuthenticationModuleModel(email: email, phoneNumber: nil, password: password)
        print("USER HAS BEEN CREATED")
        completion([model], nil)
            
        
       // completion(nil, nil)
    }
    
    
    func createNewUser(by email: String, password: String) {
        ref = db.collection("users").addDocument(data: ["email": email,
                                                        "password": password,
                                                        "phone": "+00000000000"], completion: { (error) in
                        
        })
    }
    
    func checkIfUserIsAlreadyExists(by email: String, password: String, completion: @escaping (Bool) -> Void){
        db.collection("users").getDocuments { (querySnapshot, error) in
            if let error = error {
                
            } else {
                for document in querySnapshot!.documents {
                    let email = document.data()["email"] as! String
                    if email == email {
                        print("User is already exists")
                        completion(true)
                    }
                    
                }
            }
            
        }
    }
}
