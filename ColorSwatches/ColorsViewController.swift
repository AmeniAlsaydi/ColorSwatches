//
//  ViewController.swift
//  ColorSwatches
//
//  Created by Amy Alsaydi on 11/13/20.
//

import UIKit

class ColorsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let padding: CGFloat = 16
    
    private var colorSwatches = [ColorSwatch(name: "Blue", color: .blue)] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let createColorVC = segue.destination as? CreateColorViewController else {
            fatalError("could not down cast to CreateColorViewController")
        }
        createColorVC.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ColorsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colorSwatches.count // implicit return
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // recylcing off screeen cells - efficancy
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCell.reuseId, for: indexPath) as? ColorCell else {
            fatalError("could not downcast to color cell") // dev error
        }
        
        let color = colorSwatches[indexPath.row]
        cell.configureCell(colorSwatch: color)
        
        return cell
    }
}

extension ColorsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxSize = UIScreen.main.bounds
        
        let width = maxSize.width - (padding * 2)
        let height = maxSize.height * 0.2
        
        return CGSize(width: width, height: height)
    }
    
    // review minimum interline
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let color = colorSwatches[indexPath.row]
        
        guard let detailVC = storyboard?.instantiateViewController(identifier: "DetailViewController", creator: { (coder) in
            return DetailViewController(coder: coder, colorSwatch: color)
        }) else {
            fatalError("could not type cast to DetailViewController")
        }
            
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ColorsViewController: CreateColorDelegate {
    func didCreateColor(color: ColorSwatch) {
        colorSwatches.insert(color, at: 0)
    }
}
