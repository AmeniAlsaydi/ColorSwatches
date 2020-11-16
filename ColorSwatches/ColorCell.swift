//
//  ColorCell.swift
//  ColorSwatches
//
//  Created by Amy Alsaydi on 11/13/20.
//

import UIKit

class ColorCell: UICollectionViewCell {
    
    static let reuseId = "colorCell"
    
    @IBOutlet weak var colorNameLabel: UILabel!
    
    public func configureCell(colorSwatch: ColorSwatch) {
        
        colorNameLabel.textColor = .white
        colorNameLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        layer.cornerRadius = 10
        colorNameLabel.text = colorSwatch.name
        backgroundColor = colorSwatch.color
    }
    
}
