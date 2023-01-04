//
//  AppDelegate.swift
//  Agendamento
//
//  Created by Kayky Casagrande on 27/12/22.
//
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let rootViewController = LoginViewController()
//        let rootViewController = HomeViewController()
//        let rootViewController = SignUpViewController()
//        let rootViewController = ServicesViewController()
		
		
		let navigationController = UINavigationController(rootViewController: rootViewController)

        window?.tintColor = .systemOrange

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}
