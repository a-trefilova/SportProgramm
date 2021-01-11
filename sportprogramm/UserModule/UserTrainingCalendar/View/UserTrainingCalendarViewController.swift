
import UIKit
import JTAppleCalendar

class UserTrainingCalendarViewController: UIViewController {
    let formatter = DateFormatter()
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
        setUpRootView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setUpRootView() {
        rootView?.calendarView.calendarDataSource = self
        rootView?.calendarView.calendarDelegate = self
        rootView?.calendarView.register(CustomCalendarCell.self, forCellWithReuseIdentifier: CustomCalendarCell.reuseId)
        rootView?.calendarView.register(CustomMonthHeader.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: CustomMonthHeader.reuseId)
        
        guard let countOfTrainingsPerWeek = dataModel?.excersicesByDay.count else { return }
        rootView?.setUpTitle(title: "Тренировочный календарь", description: "Необходимо выполнять \(String(countOfTrainingsPerWeek)) тренировок в неделю")
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
                                                    numberOfRows: 6,
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
    
    
    func configureCell(view: JTACDayCell?, cellState: CellState) {
        guard let cell = view as? CustomCalendarCell  else { return }
        cell.fillCellWithData(text: cellState.text)
        handleCellTextColor(cell: cell, cellState: cellState)
        handleCellSelected(cell: cell, cellState: cellState)
    }

    func handleCellSelected(cell: CustomCalendarCell, cellState: CellState) {
        if cellState.isSelected {
            cell.setCellSelected()
        } else {
            cell.setCellDeselected()
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
    
    func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        configureCell(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        configureCell(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTACMonthView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTACMonthReusableView {
        formatter.setLocalizedDateFormatFromTemplate("MMMM YYYY")
        formatter.locale = Locale(identifier: "ru_RU")
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: CustomMonthHeader.reuseId, for: indexPath) as! CustomMonthHeader
        header.label.text = formatter.string(from: range.start)
        return header
    }
    
    func calendarSizeForMonths(_ calendar: JTACMonthView?) -> MonthSize? {
        return MonthSize(defaultSize: 40)
    }
}
