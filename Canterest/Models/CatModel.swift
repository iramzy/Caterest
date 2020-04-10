//
//  CatModel.swift
//  Canterest
//
//  Created by Mohamed Ahmed on 4/8/20.
//  Copyright © 2020 Ahmed Ramzy. All rights reserved.
//

import UIKit

struct Cat {
  var caption: String
  var image: UIImage
  
  init(caption: String, image: UIImage) {
    self.caption = caption
    self.image = image
  }
  
  init?(dictionary: [String: String]) {
    guard
      let caption = dictionary["Caption"],
      let photo = dictionary["Photo"],
      let image = UIImage(named: photo)
      else {
        return nil
    }
    self.init(caption: caption, image: image)
  }

  static func allPhotos() -> [Cat] {
    var photos: [Cat] = []
    guard
      let URL = Bundle.main.url(forResource: "CatData", withExtension: "plist"),
      let photosFromPlist = NSArray(contentsOf: URL) as? [[String: String]]
      else {
        return photos
    }
    for dictionary in photosFromPlist {
      if let photo = Cat(dictionary: dictionary) {
        photos.append(photo)
      }
    }
    return photos
  }
}
