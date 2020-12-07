import Firebase

protocol UserProgrammsServiceProtocol {
//    func fetchItems(byEmail email: String, completion: @escaping (UserProgrammsModel?, Error?) -> Void)
}

/// Получает данные для модуля UserProgramms
class UserProgrammsService: UserProgrammsServiceProtocol {
    private var ref: DocumentReference? = nil
    private let db = Firestore.firestore()
    
//    func fetchItems(byEmail email: String, completion: @escaping (UserProgrammsModel?, Error?) -> Void) {
//        completion(nil, nil)
//    }
    
//    if let error = error {
//        completion(false)
//    } else {
//        for document in querySnapshot!.documents {
//            let docEmail = document.data()["email"] as! String
//            if email == docEmail {
//                print("User is already exists")
//                completion(true)
//            } else {
//                completion(false)
//            }
//
//        }
//    }
    
    func fetchItems(byEmail email: String) -> (UserProgrammsModel?) {
        var arrayOfUserProgrammsInString = [String]()
//        ref?.collection("userprogramms").getDocuments(completion: { (snapshot, error) in
//            if let error = error {
//                return
//            } else {
//                //collect all user programms from table "userprogramms"
//                for doc in snapshot!.documents {
//
//
//                    if doc.data()["email"] as! String == email {
//                      let programmName = doc.data()["programmName"] as! String
//                        arrayOfUserProgrammsInString.append(programmName)
//                    }
//                }
//            }
//
//        })
        
        
        var programmPerDay = [ProgrammPerDay]()
        ref?.collection("userprogramms").getDocuments(completion: { (snapshot, error) in
          
            for programPerDay in snapshot!.documents {
                
                print("\n")
                print("\n")
                print(programPerDay)
                
                let desc = programPerDay["description"] as! String
                let titleOfDay = programPerDay["titleOfDay"] as! String
                let numberOfExc = programPerDay["numberOfExercises"] as! Int
                
                var excersices = [Excersice]()
                self.ref?.collection("/userprogramms/user\(email)/programm1/\(programPerDay)/exercises").getDocuments(completion: { (snapshot, error) in
                    for exc in snapshot!.documents {
                        let title = exc["title"] as! String
                        let numberOfSets = exc["numberOfSets"] as! Int
                        let numberOfReps = exc["numberOfReps"] as! Int
                        let weight = exc["weight"] as! Int
                        let isSuperset = exc["isSuperset"] as! Bool
                        
                        let exercise = Excersice(title: title,
                                                 description: "",
                                                 numberOfSets: numberOfSets,
                                                 numberOfReps: numberOfReps,
                                                 weight: weight,
                                                 isSuperset: isSuperset)
                        excersices.append(exercise)
                    }
                })
                
                let programPerDay = ProgrammPerDay(titleOfDay: titleOfDay,
                                                   numberOfExercises: numberOfExc,
                                                   description: desc,
                                                   exercises: excersices)
                programmPerDay.append(programPerDay)
            }
        })
        var fp = FullProgramm(title: "program1", numberOfWeeks: 6, excersicesByDay: programmPerDay)
        var allProgs = [fp]
        let upm = UserProgrammsModel(uid: 0, email: email, name: "", userProgramms: allProgs)
        return upm
        
        
//        var arrayOfFullProgramms = [FullProgramm]()
//        ref?.collection("programmsContent").getDocuments(completion: { (snapshot, error) in
//            for item in arrayOfUserProgrammsInString {
//                for doc in snapshot!.documents {
//                    if doc.data()["title"] as! String == item {
//                        let userProgramm = FullProgramm(title: doc.data()["title"] as! String,
//                                                        numberOfWeeks: doc.data()["numberOfWeeks"] as! Int,
//                                                        excersicesByDay: <#T##[ProgrammPerDay]#>)
//                    }
//                }
//            }
//        })
        
        
    }
}


//struct FullProgramm {
//    var title: String
//    var numberOfWeeks: Int
//    var excersicesByDay: [ProgrammPerDay]
//}
//
//struct ProgrammPerDay {
//    var titleOfDay: String
//    var numberOfExercises: Int
//    var description: String
//    var exercises: [Excersice]
//}
//
//struct Excersice {
//    var title: String
//    var description: String
//    var numberOfSets: Int
//    var numberOfReps: Int
//    var weight: Int
//    var isSuperset: Bool
//
//}
