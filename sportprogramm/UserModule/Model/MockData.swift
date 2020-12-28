
import Foundation

class MockUserProgrammsData {
    let exercise1 = Excersice(title: "Отжимания", description: "С пола с собственным весом", numberOfSets: 4, numberOfReps: 15, weight: 0, isSuperset: false)
    let exercise2 = Excersice(title: "Рычажная тяга", description: "В тренажере с весом 10 кг", numberOfSets: 4, numberOfReps: 15, weight: 10, isSuperset: false)
    let exercise3 = Excersice(title: "Тяга верхнего блока", description: "В тренажере с весом 20-30 кг", numberOfSets: 4, numberOfReps: 12, weight: 30, isSuperset: false)
    let exercise4 = Excersice(title: "Присед со штангой", description: "С каждым подходом прибавлять по 10 кг", numberOfSets: 6, numberOfReps: 15, weight: 70, isSuperset: false)
    let exercise5 = Excersice(title: "Ягодичный мост", description: "В смите", numberOfSets: 6, numberOfReps: 12, weight: 40, isSuperset: false)
    let exercise6 = Excersice(title: "Выпады с гантелями", description: "В одну сторону на одной ноге, обратно на другой", numberOfSets: 4, numberOfReps: 12, weight: 8, isSuperset: false)
    let exercise7 = Excersice(title: "Тяга нижнего блока", description: "С длинной рукоятью", numberOfSets: 5, numberOfReps: 15, weight: 30, isSuperset: false)
    let exercise8 = Excersice(title: "Рывковая тяга", description: "С гирей 16 кг", numberOfSets: 4, numberOfReps: 15, weight: 16, isSuperset: false)
    let exercise9 = Excersice(title: "Бицепс с гантелями сидя", description: "", numberOfSets: 4, numberOfReps: 20, weight: 6, isSuperset: false)
    let exercise10 = Excersice(title: "Упражнение Молоток", description: "с гантелями", numberOfSets: 4, numberOfReps: 20, weight: 8, isSuperset: false)
    
    var exercisesPerFirstDay = [Excersice]()
    var exercisesPerSecondDay = [Excersice]()
    
    let oneDay: ProgrammPerDay
    let twoDay: ProgrammPerDay
    
    let programm: UserProgrammsModel
    
    
    init() {
        exercisesPerFirstDay.append(exercise1)
        exercisesPerFirstDay.append(exercise2)
        exercisesPerFirstDay.append(exercise3)
        exercisesPerFirstDay.append(exercise4)
        
        exercisesPerSecondDay.append(exercise5)
        exercisesPerSecondDay.append(exercise6)
        exercisesPerSecondDay.append(exercise7)
        exercisesPerSecondDay.append(exercise8)
        exercisesPerSecondDay.append(exercise9)
        
        oneDay = ProgrammPerDay(titleOfDay: "Понедельник", numberOfDay: 1, numberOfExercises: 4, description: "Первый день программы, состоит из 4 упражнений", exercises: exercisesPerFirstDay )
        twoDay = ProgrammPerDay(titleOfDay: "Четверг", numberOfDay: 2, numberOfExercises: 5, description: "Второй день программы, состоит из 5 упражнений", exercises: exercisesPerSecondDay )
        
        programm = UserProgrammsModel(uid: 0, email: "Atrefilova97@icloud.com", name: "", userProgramms: [FullProgramm(title: "Программа №1", numberOfWeeks: 6, excersicesByDay: [oneDay, twoDay])])
        
    }
    
}
