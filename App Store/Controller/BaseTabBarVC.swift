//
//  BaseTabBarVC.swift
//  App Store
//
//  Created by Lucas Sesti on 24/09/20.
//

import UIKit

class BaseTabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hojeVC = self.criarTabItem(viewController: UIViewController(), title: "Hoje", image: "icone-hoje")
        
        let appsVC = self.criarTabItem(viewController: AppsVC(), title: "Apps", image: "icone-apps")
        
        let buscaVC = self.criarTabItem(viewController: BuscaVC(), title: "Busca", image: "icone-busca")
        
        viewControllers = [
            hojeVC,
            appsVC,
            buscaVC
        ]
        
        selectedIndex = 1
    }
    
    func criarTabItem(viewController: UIViewController, title: String, image: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        
        viewController.navigationItem.title = title
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: image)
//        viewController.view.backgroundColor = .white
        
        return navController
    }
    
    
}
