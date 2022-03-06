//
//  ViewController.swift
//  RGBColorChanger
//
//  Created by Никита on 06.03.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var rgbView: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

