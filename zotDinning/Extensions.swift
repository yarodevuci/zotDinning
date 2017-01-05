//
//  Extensions.swift
//  zotDinning
//
//  Created by Yaroslav Dukal on 1/4/17.
//  Copyright © 2017 Yaro. All rights reserved.
//

import Foundation
import UIKit


//MARK: UIViewController extension
extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func pushViewController(withIdentifier: String) {
        let publicChatMessagesVC = self.storyboard?.instantiateViewController(withIdentifier: withIdentifier)
        navigationController?.pushViewController(publicChatMessagesVC!, animated: true)
    }
    
    func presentViewController(withIdentifier: String, animated: Bool) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: withIdentifier)
        present(vc!, animated: animated, completion: nil)
    }
    
    func presentViewControllerWithNavBar(identifier: String, animated: Bool) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: identifier)
        let navController = UINavigationController(rootViewController: vc)
        self.present(navController, animated: animated, completion: nil)
    }
    
    func showAlert(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func dismissKeyboard() { view.endEditing(true) }
}
