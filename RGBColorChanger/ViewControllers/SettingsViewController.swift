//
//  ViewController.swift
//  RGBColorChanger
//
//  Created by Никита on 06.03.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func saveSettings(_ color: UIColor)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var delegate: SettingsViewControllerDelegate!
    var mainColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setValueForSlider()
        setDefaultSetting()
    }
    
    
    @IBAction func slider(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redLabel.text = roundingValues(sender.value)
            redTextField.text = roundingValues(sender.value)
        case 1:
            greenLabel.text = roundingValues(sender.value)
            greenTextField.text = roundingValues(sender.value)
        case 2:
            blueLabel.text = roundingValues(sender.value)
            blueTextField.text = roundingValues(sender.value)
        default:
            break
        }
        setDefaultSetting()
    }
    
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        delegate.saveSettings(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    private func setDefaultSetting() {
        
        redLabel.text = roundingValues(redSlider.value)
        redTextField.text = roundingValues(redSlider.value)
        
        greenLabel.text = roundingValues(greenSlider.value)
        greenTextField.text = roundingValues(greenSlider.value)
        
        blueLabel.text = roundingValues(blueSlider.value)
        blueTextField.text = roundingValues(blueSlider.value)
        
        colorView.layer.cornerRadius = colorView.frame.width / 15
        getsColor()
    }
    
    private func setValueForSlider() {
        let sliderVaiue = CIColor(color: mainColor ?? .white)
        
        redSlider.value = Float(sliderVaiue.red)
        greenSlider.value = Float(sliderVaiue.green)
        blueSlider.value = Float(sliderVaiue.blue)
        
        colorView.backgroundColor = mainColor
    }
    
    private func getsColor() {
        
        let color = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        colorView.backgroundColor = color
    }
    
    private func roundingValues(_ value: Float) -> String {
        String(format: "%.2f", value)
    }
}

