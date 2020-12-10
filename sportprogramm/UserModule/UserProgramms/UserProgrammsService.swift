import Firebase

protocol UserProgrammsServiceProtocol {
     func fetchItems(byEmail email: String, complition:  @escaping (UserProgrammsModel) -> Void) 
//    func fetchItems(byEmail email: String, completion: @escaping (UserProgrammsModel?, Error?) -> Void)
}

/// Получает данные для модуля UserProgramms
class UserProgrammsService: UserProgrammsServiceProtocol {
    private var ref: DocumentReference? = nil
    private let db = Firestore.firestore()

    func fetchItems(byEmail email: String, complition: @escaping (UserProgrammsModel) -> Void) {
        
        var allProgrammsName = ""
        var userProgramms = [FullProgramm]()
        
        //here we getting the documentName for current user by his email and names for all programms
        //the result is name of document, where all user programms handle + all names
        db.collection("userprogramms").getDocuments { (snap, error) in
            var nameOfDoc = "user" + email
            var allProgrammsNames: [String] = []
            for doc in snap!.documents {
                if doc["email"] as? String == email {
                    allProgrammsName = "user" + email
                    guard let countOfAllProgramms = doc["numberOfAllProgramms"] as? Int else { return }
                    for number in 1...countOfAllProgramms {
                        let variableForNameOfProgramm = "programm" + String(describing: number)
                        let nameOfProgramm = doc["\(variableForNameOfProgramm)"] as? String
                        allProgrammsNames.append(nameOfProgramm ?? "")
                        
                    }
                }
            }
            
            //var userProgramms = [FullProgramm]()
             for item in allProgrammsNames {
                let newRefToProgrammContent = self.db.collection("userprogramms").document(allProgrammsName).collection("\(item)")
                 newRefToProgrammContent.getDocuments { (snap, error) in
                     
                     
                     //getting number of training days in one programm
                     var arrayOfAllDays = [Int]()
                     for doc in snap!.documents {
                        guard let numberOfDay = doc["day"] as? Int else { return }
                         arrayOfAllDays.append(numberOfDay)
                     }
                     
                     //getting names of documents per day
                     var arrayOfDocumentPerDayNames = [String]()
                     if arrayOfAllDays.count >= 1 {
                         for doc in snap!.documents {
                            guard let nameOfProgrammPerDay = doc["nameOfDocument"] as? String else { return }
                             arrayOfDocumentPerDayNames.append(nameOfProgrammPerDay)
                         }
                     }
                     
                     var arrayOfProgrammsPerDay = [ProgrammPerDay]()
                     //getting all programms per day
                     for doc in snap!.documents {
                       guard  let titleOfDay = doc["titleOfDay"] as? String,
                         let numberOfExercises = doc["numberOfExercises"] as? Int,
                         let description = doc["description"] as? String else { return }
                         var arrayOfExercisesPerDay = [Excersice]()
                         if arrayOfDocumentPerDayNames.count >= 1 {
                             for element in arrayOfDocumentPerDayNames {
//                                 let newRefToExcersices = self.db.collection("userprogramms").document(allProgrammsName).collection("\(String(describing: item))").document("\(String(describing: element))").collection("exercises")
//                                print(String(describing: newRefToExcersices))
                                
                                 self.db.collection("userprogramms").document(allProgrammsName).collection("\(String(describing: item))").document("\(String(describing: element))").collection("exercises").getDocuments { (snapshot, error) in
                                     for document in snapshot!.documents {
                                       guard  let title = document["title"] as? String,
                                         let numberOfSets = document["numberOfSets"] as? Int,
                                         let numberOfReps = document["numberOfReps"] as? Int,
                                         let weight = document["weight"] as? Int,
                                         let isSuperset = document["isSuperset"] as? Bool else { return }
                                         let exercise = Excersice(title: title,
                                                                  description: "",
                                                                  numberOfSets: numberOfSets,
                                                                  numberOfReps: numberOfReps,
                                                                  weight: weight,
                                                                  isSuperset: isSuperset)
                                         arrayOfExercisesPerDay.append(exercise)
                                     }
                                 }
                                 
                             }
                         } else {
                             print("Theres no training programms here ")
                         }
                         
                         let programmPerDay = ProgrammPerDay(titleOfDay: titleOfDay,
                         numberOfExercises: numberOfExercises,
                         description: description, exercises: arrayOfExercisesPerDay)
                         arrayOfProgrammsPerDay.append(programmPerDay)
                     } //getting all programms per day
                     
                 
                    let fullProgramm = FullProgramm(title: item, numberOfWeeks: 5, excersicesByDay: arrayOfProgrammsPerDay)
                    userProgramms.append(fullProgramm)
                 }
             }
            let userProgrammsModel = UserProgrammsModel(uid: 0, email: email, name: "", userProgramms: userProgramms)
            print(userProgrammsModel)
            complition(userProgrammsModel)
            
        }

        

        
    }//end of func
    
    
    
    
    
    
    
    
    
}//end of class


