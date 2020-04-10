//
//  CatsVC.swift
//  Canterest
//
//  Created by Mohamed Ahmed on 4/8/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import UIKit

class CatsVC: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    var cats = Cat.allPhotos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
          layout.delegate = self
        }
    }
    
}

extension CatsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return cats.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatCell", for: indexPath ) as! CatCell
      cell.cat = cats[indexPath.item]
      cell.layoutIfNeeded()
      return cell
    }

}


extension CatsVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
      return CGSize(width: itemSize, height: itemSize)
    }
    
}


extension CatsVC: PinterestLayoutDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    print(cats[indexPath.item].image.size.height)
    return cats[indexPath.item].image.size.height
  }
}
