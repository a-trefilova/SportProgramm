
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    static var isAuthorized: Bool = false

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if SceneDelegate.isAuthorized == false {
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
        if SceneDelegate.isAuthorized == true {
            let builder = UserModuleBuilder()
            guard let model = AuthenticationModuleViewController.transferToUserModuleModel else { return }
            let state = UserModule.ViewControllerState.loading(model)
            let controller = builder.set(initialState: state).build()
            
            let navController = UINavigationController(rootViewController: controller)
            navController.navigationBar.prefersLargeTitles = true
            guard let windowScene = (scene as? UIWindowScene) else { return }
            
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene = windowScene
            window?.rootViewController = navController
            window?.makeKeyAndVisible()
        }
    }

}

