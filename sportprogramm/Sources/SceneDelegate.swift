
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    static var isAuthorized: Bool = false
    let defaults = UserDefaults.standard
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if defaults.object(forKey: "userEmail") != nil {
            let builder = UserModuleBuilder()
            let mockData = MockUserProgrammsData()
            guard let email = defaults.object(forKey: "userEmail") as?  String else { return }
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
          
        } else {
            let builder = AuthenticationModuleBuilder()
            let controller = builder.build()
            let navController = UINavigationController(rootViewController: controller)
            navController.navigationBar.prefersLargeTitles = true
            navController.navigationBar.backgroundColor = .clear
            
            guard let windowScene = (scene as? UIWindowScene) else { return }
            
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene = windowScene
            window?.rootViewController = navController
            window?.makeKeyAndVisible()
        }

    }

}

