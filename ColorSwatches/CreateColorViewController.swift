//
//  CreateColorViewController.swift
//  ColorSwatches
//
//  Created by Amy Alsaydi on 11/13/20.
//

// naming

import UIKit

protocol CreateColorDelegate: AnyObject { //
    func didCreateColor(color: ColorSwatch)
}

class CreateColorViewController: UIViewController {

    @IBOutlet weak var colorNameTextField: UITextField!
    @IBOutlet weak var colorView: UIView!
    
    private let colors: [UIColor] = [.yellow, .red, .purple, .systemPink, .systemTeal]
    
    
    weak var delegate: CreateColorDelegate? // optional might or might not be set
    // weak only workds on class types and requires "Anyobject" or class conformance
    
    private var colorPickerController: UIColorPickerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let radomColor = colors.randomElement() ?? .gray
        
        colorNameTextField.placeholder = "Enter color name"
        colorPickerController = UIColorPickerViewController()
        colorPickerController.selectedColor = radomColor
        colorView.backgroundColor = radomColor
        colorPickerController.delegate = self
    }
    
    
    @IBAction func pickColorPressed(_ sender: UIButton) {
        present(colorPickerController, animated: true, completion: nil)
    }
    
    
    @IBAction func createColorButton(_ sender: UIButton) {
        
        guard let colorName = colorNameTextField.text,
              !colorName.isEmpty else {
            print("missing field")
            // TODO: Alert controller would be more appropriate
            return
        }
        
        let createdColor = ColorSwatch(name: colorName, color: colorPickerController.selectedColor)
        delegate?.didCreateColor(color: createdColor)
        
        dismiss(animated: true, completion: nil)
    }
}

extension CreateColorViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorView.backgroundColor = colorPickerController.selectedColor
        // update variable
    }
}
