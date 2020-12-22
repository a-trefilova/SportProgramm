
import UIKit
import JTAppleCalendar

class UserTrainingCalendarViewController: UIViewController {
    
    var presenter: UserTrainingCalendarPresenterProtocol?
    var dataModel: FullProgramm?
    var rootView: UserTrainingCalendarView? {
        return view as? UserTrainingCalendarView
    }
    
    // MARK: View lifecycle
    override func loadView() {
        view = UserTrainingCalendarView(frame: .zero)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.presentCalendar()
        rootView?.calendarView.calendarDataSource = self
        rootView?.calendarView.calendarDelegate = self
        rootView?.calendarView.register(CustomCalendarCell.self, forCellWithReuseIdentifier: CustomCalendarCell.reuseId)
        title = "Тренировки"
        rootView?.setUpTitle(title: "Выберите день начала программы", description: "Необходимо выполнять \(String(describing: dataModel?.excersicesByDay.count)) тренировок в неделю")
    }


}

extension UserTrainingCalendarViewController: UserTrainingCalendarViewProtocol {
    func startLoading() {
        //rootView.activityIndicator.startanimatign
    }
    
    func finishLoading() {
        //rootView.activityIndicator.stopanimatign
    }
    
    func setTrainingCalendar(forProgramm programm: FullProgramm) {
        dataModel = programm
    }
    
    
}


extension UserTrainingCalendarViewController: JTACMonthViewDataSource {
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: "2020 09 01")!
        let endDate = Date()
       
        let configParams =  ConfigurationParameters(startDate: startDate,
                                                    endDate: endDate,
                                                    numberOfRows: 5,
                                                    generateInDates: InDateCellGeneration.forAllMonths,
                                                    generateOutDates: OutDateCellGeneration.tillEndOfRow,
                                                    firstDayOfWeek: DaysOfWeek?.some(DaysOfWeek.monday),
                                                    hasStrictBoundaries: false)
        
        return configParams
    }
    

        
    func handleCellTextColor(cell: CustomCalendarCell, cellState: CellState) {
       if cellState.dateBelongsTo == .thisMonth {
          cell.fillCellWithData(text: cellState.text)
       } else {
          cell.fillCellWithData(text: "")
       }
    }
}

extension UserTrainingCalendarViewController: JTACMonthViewDelegate {
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = cell as! CustomCalendarCell
        handleCellTextColor(cell: cell, cellState: cellState)
        // cell.fillCellWithData(text: cellState.text)
    }
    
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: CustomCalendarCell.reuseId, for: indexPath) as! CustomCalendarCell
       // cell.fillCellWithData(text: cellState.text)
        handleCellTextColor(cell: cell, cellState: cellState)
        return cell
        
    }
    
    
    
    
}
