//
//  AppManager.swift
//  ProjectManager
//
//  Created by kyungmin on 2023/10/26.
//

import UIKit

final class AppManager {
    var mainViewController: UIViewController?
    
    func start() {
        let todoViewController = PlanCollectionViewController()
        let doingViewController = PlanCollectionViewController()
        let doneViewController = PlanCollectionViewController()
        
        mainViewController = MainViewController(todoViewController: todoViewController, doingViewController: doingViewController, doneViewController: doneViewController)
    }
}
