//
//  CatCell.swift
//  Canterest
//
//  Created by Mohamed Ahmed on 4/8/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import UIKit

class CatCell: UICollectionViewCell {
    @IBOutlet var catImage: UIImageView!
    @IBOutlet var catCaption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        catImage.image = nil
        catCaption.text = ""
    }
    
    var cat: Cat? {
      didSet {
        if let cat = cat {
          catImage.image = cat.image
          catCaption.text = cat.caption

        }
      }
    }

}
