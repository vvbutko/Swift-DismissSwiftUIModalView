//
//  ViewController.swift
//  DismissSwiftUIModalView
//
//  Created by Vladimir Butko on 03/10/2021.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }

    private func configureViewController() {
        title = "Dismiss SwiftUI Modal View"
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let presentSettingsAction = UIAction { [unowned self] _ in
            self.presentSwiftUISettingsScreen()
        }
        
        let settingsButton = UIBarButtonItem(
            image: UIImage(systemName: "gear"),
            primaryAction: presentSettingsAction
        )
        
        navigationItem.rightBarButtonItem = settingsButton
    }
    
    private func presentSwiftUISettingsScreen() {
        let settingsScreen = SettingsScreen(
            dismissAction: { [unowned self] in
                self.dismiss(animated: true, completion: nil)
            }
        )
        
        let hostingController = UIHostingController(rootView: settingsScreen)
        present(hostingController, animated: true, completion: nil)
    }
}

