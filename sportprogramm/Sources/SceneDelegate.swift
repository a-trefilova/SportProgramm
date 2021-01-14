
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    static var isAuthorized: Bool = false
    let defaults = UserDefaults.standard
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let builder = UserModuleBuilder()
        let mockData = MockUserProgrammsData()
        
        var model = mockData.userData
        var models = [UserProgrammsModel]()
        models.append(model)
                   // let state = UserModule.ViewControllerState.loading(model)
        let state = UserModule.ViewControllerState.result(models)
        let controller = builder.set(initialState: state).build()
        
        let navController = UINavigationController(rootViewController: controller)
        navController.navigationBar.prefersLargeTitles = true
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        guard let email = defaults.object(forKey: "userEmail") as?  String else {
                if defaults.object(forKey: "userEmail") == nil {
                           let builder = AuthenticationModuleBuilder()
                           let controller = builder.build()
                           navController.pushViewController(controller, animated: true)
                }
        
        return }
       
    }

}

