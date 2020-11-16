//
//  DetailViewController.swift
//  ColorSwatches
//
//  Created by Amy Alsaydi on 11/13/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var colorSwatch: ColorSwatch
    
    // failable intializer: entire intializer returns nil (aka optional)
    init?(coder: NSCoder, colorSwatch: ColorSwatch) {
        self.colorSwatch = colorSwatch
        super.init(coder: coder) // all unintializer properties must be set before calling super (parent)
        // coder when using storyboard ******
    }
    
    required init?(coder: NSCoder) { // because its coming from storyboard we need the parent init - even though it wont get called
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colorSwatch.color
        navigationItem.title = colorSwatch.name
    }
}
