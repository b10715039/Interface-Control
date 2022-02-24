//
//  ViewController.swift
//  Class2
//
//  Created by mac12 on 2022/2/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let fontName = ["Symbol", "Times New Roman", "Zapfino", "Chalkduster"]
    let fontSize = ["20", "21", "22", "23", "24", "25", "26"]
    var currentSize: CGFloat = 20
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0) {
            return fontName.count
        }
        return fontSize.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return fontName[row]
        }
        return fontSize[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            nameLabel.font = UIFont(name:fontName[row], size:currentSize)
            numberLabel.font = UIFont(name: fontName[row], size:currentSize)
        } else {
            currentSize = CGFloat(Double(fontSize[row])!)
            nameLabel.font = nameLabel.font.withSize(currentSize)
            numberLabel.font = numberLabel.font.withSize(currentSize)
            
        }
    }

    @IBOutlet weak var HPC: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numTextField: UITextField!
    @IBOutlet weak var alpha: UILabel!
    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var secureSwitch: UISwitch!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var pickView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        HPC.contentMode = .scaleAspectFit
        //reload after mode changed
        HPC.image = UIImage(named: "HPC.png")
        alpha.text = String(format: "%.1f", sliderValue.value)
        // Do any additional setup after loading the view.
    }

    @IBAction func nameTextField(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func alphaSlider(_ sender: UISlider) {
        alpha.text = String(format: "%.1f", sender.value)
        HPC.alpha = CGFloat(sender.value)
        HPC.image = UIImage(named: "HPC.png")
    }
    @IBAction func secureText(_ sender: UISwitch) {
        if sender.isOn {
            numTextField.isSecureTextEntry = true
        }
        else {
            numTextField.isSecureTextEntry = false
        }
    }
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            alphaSlider.isHidden = false
            secureSwitch.isHidden = false
            alpha.isHidden = false
        } else {
            alphaSlider.isHidden = true
            secureSwitch.isHidden = true
            alpha.isHidden = true
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        numTextField.resignFirstResponder()
    }
}

