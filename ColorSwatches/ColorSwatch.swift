//
//  ColorSwatch.swift
//  ColorSwatches
//
//  Created by Amy Alsaydi on 11/13/20.
//

import UIKit

// TODO: struct vs class?
// default to struct becasue struct is immutable by default
// passing copies around
// class: if you want a signle instance throughout app.
// we dont want to inherit so noneed for class

struct ColorSwatch {
    let name: String
    let color: UIColor
}
