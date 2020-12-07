

import Foundation

protocol UserActivityViewProtocol {
    func setUserActivity(_ activity: Int)
}

protocol UserActivityPresenterProtocol {
    init(view: UserActivityViewProtocol, userActivity: UserActivity)
    func showUserActivity()
}

class UserActivityPresenter: UserActivityPresenterProtocol {
    let view: UserActivityViewProtocol
    let model: UserActivity
    /* let activityService = UserActivityService() */
    required init(view: UserActivityViewProtocol, userActivity: UserActivity) {
        self.view = view
        self.model = userActivity
    }
    
    func showUserActivity() {
        //let activity = activityService.getUserActivity()
        let activity = self.model.allTrainingsCount
        self.view.setUserActivity(activity)
    }
    
    
}
