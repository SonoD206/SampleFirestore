//
//  TodoCollectionViewCell.swift
//  SampleCollectionAndFireStore
//
//  Created by cmStudent on 2021/06/20.
//

import UIKit

class TodoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var todoLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 5.0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
