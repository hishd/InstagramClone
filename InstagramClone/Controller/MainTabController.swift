//
//  MainTabController.swift
//  InstagramClone
//
//  Created by Hishara Dilshan on 2022-04-24.
//

import UIKit

class MainTabController: UITabBarController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
    
    // MARK: Helpers
    
    func configureVC() {
        let layout = UICollectionViewFlowLayout()
        let feedVc = createNavigationController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: FeedController(collectionViewLayout: layout))
        let searchVc = createNavigationController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: SearchController())
        let imageSelectorVc = createNavigationController(unselectedImage: #imageLiteral(resourceName: "plus_unselected"), selectedImage: #imageLiteral(resourceName: "plus_unselected"), rootViewController: ImageSelectorController())
        let notificationVc = createNavigationController(unselectedImage: #imageLiteral(resourceName: "like_unselected"), selectedImage: #imageLiteral(resourceName: "like_selected"), rootViewController: NotificationController())
        let profileVc = createNavigationController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: ProfileController())
        
        /// Setting the baclground of the TabBar since iOS 15 bring transparent Tab Bar
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .systemBackground
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        
        tabBar.tintColor = UIColor(named: "tabBarColor")
        viewControllers = [feedVc, searchVc, imageSelectorVc, notificationVc, profileVc]
    }
    
    func createNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let navVC = UINavigationController(rootViewController: rootViewController)
        navVC.tabBarItem.image = unselectedImage
        navVC.tabBarItem.selectedImage = selectedImage
        navVC.navigationBar.tintColor = .black
        return navVC
    }
}
