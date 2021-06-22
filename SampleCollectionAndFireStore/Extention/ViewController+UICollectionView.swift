//
//  ViewController+UICollectionView.swift
//  SampleCollectionAndFireStore
//
//  Created by cmStudent on 2021/06/21.
//

import UIKit
import FirebaseFirestore

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todoLists.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodoCollectionViewCell", for: indexPath) as! TodoCollectionViewCell

        cell.todoLabel.lineBreakMode = .byWordWrapping
        cell.todoLabel.text = todoLists[indexPath.row]
    
        return cell
    }
    
}
