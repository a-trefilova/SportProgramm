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
       // var arrayToShow = [Int]()
        
        
            let programms = self.getTheIDsOfUserProgramms(email: email)
            let userModel = UserProgrammsModel(uid: 0, email: email, name: "USERNAME", userProgramms: programms)
            print(userModel)
            DispatchQueue.main.async {
                complition(userModel)
            }
            
        
        
            
            
    }
        //print(arrayToShow)
        
      /* gettingAnArrayOfProgrammsForUser(byEmail: email) { (userProgramms) in
         let userProgramms = userProgramms
         let userProgrammsModel = UserProgrammsModel(uid: 0, email: email, name: "", userProgramms: userProgramms)
         //print(userProgrammsModel)
         complition(userProgrammsModel)
        print(userProgrammsModel)
        }
      */
    
    
    
    
 /*   private func gettingAnArrayOfProgrammsForUser(byEmail email: String, complition: @escaping ([FullProgramm]) -> Void ) {
        let refToUserProgramms = db.collection("userprogramms")
        
        refToUserProgramms.getDocuments { (snap, error) in
            // every doc is user
            for doc in snap!.documents {
                if doc["email"] as? String == email  {
                    var userProgramms = [FullProgramm]()
                    guard let email = doc["email"] as? String,
                          let numberOfProgramms = doc["numberOfAllProgramms"] as? Int
                    else { return }
                    
                    let nameOfDocWithAllProgramms = "user" + email
                    var arrayOfProgrammNames = [String]()
                    
                    //getting names of programms
                    for number in 1...numberOfProgramms {
                        let variableForNameOfProgramm = "programm" + String(describing: number)
                        guard let nameOfProgramm = doc["\(variableForNameOfProgramm)"] as? String else { return }
                        arrayOfProgrammNames.append(nameOfProgramm)
                        
                    }
                    
                    //getting programms
                    for name in arrayOfProgrammNames {
                        self.gettingAnArrayOfAllDaysInProgramm(nameOfDocWithAllProgramms: nameOfDocWithAllProgramms,
                                                               nameOfDocumentWithExactProgramm: name) { (programms) in
                                    let programmDays = programms
                                    let programm = FullProgramm(title: name, numberOfWeeks: programmDays.count, excersicesByDay: programmDays)
                                    userProgramms.append(programm)
                        }
                    }
                    
                    print(userProgramms)
                    complition(userProgramms)
                }
                
            }
        }
        
    }
    
    private func gettingAnArrayOfAllDaysInProgramm(nameOfDocWithAllProgramms: String, nameOfDocumentWithExactProgramm: String, complition: @escaping ([ProgrammPerDay]) -> Void ) {
        let refToDays = db.collection("userprogramms")
                        .document(nameOfDocWithAllProgramms)
                        .collection(nameOfDocumentWithExactProgramm)
        
        refToDays.getDocuments { (snap, error) in
            var arrayOfDaysWithProgramms = [ProgrammPerDay]()
            //every doc is a training day
            for doc in snap!.documents {
                guard let title = doc["titleOfDay"] as? String,
                      let numberOfDay = doc["day"] as? Int,
                      let numberOfExercises = doc["numberOfExercises"] as? Int,
                      let description = doc["description"] as? String,
                      let nameOfDoc = doc["nameOfDocument"] as? String
                else { return }
               
                self.gettingArrayOfExercisesPerDay(nameOfDocWithAllProgramms: nameOfDocWithAllProgramms,
                                                   nameOfDocumentWithExactProgramm: nameOfDocumentWithExactProgramm,
                                                   nameOfDocumentWithExactDay: nameOfDoc) { (exercises) in
                    let exercises = exercises
                    let programmPerDay = ProgrammPerDay(titleOfDay: title,
                                                        numberOfDay:numberOfDay ,
                                                        numberOfExercises: numberOfExercises,
                                                        description: description,
                                                        exercises: exercises)
                    arrayOfDaysWithProgramms.append(programmPerDay)
                }
            }
            print(arrayOfDaysWithProgramms)
            complition(arrayOfDaysWithProgramms)
            
        }
       
    }
    
    
    
    
    private func gettingArrayOfExercisesPerDay(nameOfDocWithAllProgramms: String, nameOfDocumentWithExactProgramm: String, nameOfDocumentWithExactDay: String, complition: @escaping ([Excersice]) -> Void ) {
        
        let refToExercises = db.collection("userprogramms")
                            .document(nameOfDocWithAllProgramms)
                            .collection(nameOfDocumentWithExactProgramm)
                            .document(nameOfDocumentWithExactDay).collection("exercises")
        var arrayOfExercises = [Excersice]()
        refToExercises.getDocuments { (snap, error) in
            for document in snap!.documents {
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
                arrayOfExercises.append(exercise)
            }
            complition(arrayOfExercises)
        }
       
    }
    
   */
    
    
    func getTheIDsOfUserProgramms(email: String) -> [FullProgramm] {
        
        func getTheIdsOfDaysInOneProgramm(programmId: Int) -> [Int] {
            let ref = db.collection("programms")
            var arrayOfIds = [Int]()
            ref.getDocuments { (snap, error) in
                for doc in snap!.documents {
                    guard let proId = doc["programmID"] as? Int else { return }
                    if programmId == proId {
                        guard let numberOfDaysInPro = doc["daysInProgramm"] as? Int else { return }
                        for number in 1...numberOfDaysInPro {
                            guard let dayId = doc["day + \(String(describing: number)) + ID"] as? Int else { return }
                            arrayOfIds.append(dayId)
                        }
                    }
                }
                
            }
            
            return arrayOfIds
        }
        
        
        let db = Firestore.firestore()
        var userProgramms = [FullProgramm]()
        let ref = db.collection("userprogramms")
        var arrayOfIds = [Int]()
        ref.getDocuments { (snap, error) in
            for doc in snap!.documents {
                if doc["email"] as? String == email {
                    guard let numberOfAllProgramms = doc["numberOfAllProgramms"] as? Int else { return }
                    for number in 1...numberOfAllProgramms {
                        guard let iDofProgramm = doc["programm + \(String(describing: number)) + ID"] as? Int else { return }
                        arrayOfIds.append(iDofProgramm)
                    }
                }
            }
            for item in arrayOfIds {
                let arrayOfDaysIds = getTheIdsOfDaysInOneProgramm(programmId: item)
                var arrayOfDays = [ProgrammPerDay]()
                
                for element in arrayOfDaysIds {
                    
                    getTheExercisesPerDay(dayId: element) { (exercises) in
                        var oneDay = ProgrammPerDay(titleOfDay: "", numberOfDay: 0, numberOfExercises: 0, description: "", exercises: [])
                        oneDay.exercises = exercises
                        oneDay.numberOfExercises = exercises.count
                        arrayOfDays.append(oneDay)
                        print(oneDay)
                    }
                    
                }
                let fullProgram = FullProgramm(title: "", numberOfWeeks: 10, excersicesByDay: arrayOfDays)
                userProgramms.append(fullProgram)
            }
            //complition(arrayOfIds)
        }
        
        
        
        func getTheExercisesPerDay(dayId: Int, complition: @escaping ([Excersice]) -> Void) {
            let ref = db.collection("dailyProgramms")
            ref.getDocuments { (snap, error) in
                for doc in snap!.documents {
                    guard let dayId = doc["dayID"] as? Int else { return }
                    if dayId == dayId {
                        guard let numberOfExercises = doc["numberOfExercises"] as? Int else { return }
                        var exercises = [Excersice]()
                        for number in 1...numberOfExercises {
                          guard  let desc = doc["ex + \(number) + description"] as? String,
                            let sets = doc["ex + \(number) + sets"] as? Int,
                            let reps = doc["ex + \(number) + reps"] as? Int,
                            let weight = doc["ex + \(number) + weight"] as? Int else { return }
                            let exercice = Excersice(title: "",
                                                     description: desc, numberOfSets: sets, numberOfReps: reps, weight: weight, isSuperset: false)
                            exercises.append(exercice)
                        }
                        complition(exercises)
                    }
                }
            }
        }
        
        
        
        return userProgramms
    }


    
    
    
    
    
}//end of class


