//
//  TabBarDelegate.swift
//  Microinteractions
//
//  Created by Stephen Bassett on 5/21/19.
//  Copyright © 2019 Stephen Bassett. All rights reserved.
//

import Foundation
import UIKit

class TabBarDelegate: NSObject, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controllerIndex = tabBarController.viewControllers?.firstIndex(of: viewController) else { return }
        guard let tabBarView = tabBarController.tabBar.items![controllerIndex].value(forKey: "view") as? UIView else { return }
        let imageView = tabBarView.subviews.compactMap { $0 as? UIImageView }.first
        UIView.animate(withDuration: 0.25, delay: 0, options: [.curveEaseInOut], animations: {
            imageView?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseInOut], animations: {
                imageView?.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            }) { _ in
                UIView.animate(withDuration: 0.25, delay: 0, options: [.curveEaseInOut], animations: {
                    imageView?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                }) { _ in
                    UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseInOut], animations: {
                        imageView?.transform = CGAffineTransform.identity
                    }, completion: nil)
                }
            }
        }
    }
    
}
