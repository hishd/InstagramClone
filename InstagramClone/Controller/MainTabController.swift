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
        let feedVc = FeedController()
        let searchVc = SearchController()
        let imageSelectorVc = ImageSelectorController()
        let notificationVc = NotificationController()
        let profileVc = ProfileController()
        
        viewControllers = [feedVc, searchVc, imageSelectorVc, notificationVc, profileVc]
    }
}
