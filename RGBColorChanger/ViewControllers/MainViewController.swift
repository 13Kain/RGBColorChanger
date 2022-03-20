//
//  MainViewController.swift
//  RGBColorChanger
//
//  Created by Никита on 20.03.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationVC = segue.destination as! UINavigationController
        let settingsVC = navigationVC.viewControllers.first as! SettingsViewController
        settingsVC.mainColor = view.backgroundColor
        settingsVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func saveSettings(_ color: UIColor) {
        view.backgroundColor = color
    }
}
