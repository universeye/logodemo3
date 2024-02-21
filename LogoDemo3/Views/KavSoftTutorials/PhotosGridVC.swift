//
//  PhotosGridVC.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2023/10/15.
//

import UIKit

class PhotoGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // Your code goes here
    let images = [ UIImage(named: "image1"), UIImage(named: "image2"), UIImage(named: "image3"), UIImage(named: "image4"), UIImage(named: "image5"), UIImage(named: "image6"), UIImage(named: "image7") ]
    private var collectionView: UICollectionView!
    
    // Array to store selected items
    private var selectedItems: [IndexPath] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize and configure the collection view
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.allowsMultipleSelection = true
        view.addSubview(collectionView)
        
        // Your code goes here
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return the total number of items in your data source
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        // Configure the cell with your photo or content
        // For example:
        
        cell.backgroundColor = UIColor.gray
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 3 // Divide the width into 3 equal parts for 3 items in a row
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItems.append(indexPath)
        // Handle selection, e.g., update UI or perform an action
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let index = selectedItems.firstIndex(of: indexPath) {
            selectedItems.remove(at: index)
        }
        // Handle deselection, e.g., update UI or perform an action
    }
    
    // Your code goes here
}
