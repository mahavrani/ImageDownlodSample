//
//  Details.swift
//  ImageDownlodSample
//
//  Created by maharani.s on 12/22/17.
//  Copyright © 2017 Macadmin. All rights reserved.
//

import Foundation

class Details {
    var imageURL , imageDesc :String?
    init(imageURL : String ,imageDesc :String) {
        self.imageURL = imageURL
        self.imageDesc = imageDesc
    }
}

/*
 var isEnityName : String { // Compupute Properties
 get {
 return self.entityName!
 }
 }
 
 var isSetName : String {
 get {
 return self.entityName!
 
 }
 set {
 self.entityName = newValue
 }
 }
 
 case details = "details"
 case imageURL = "ImageURL"
 case imageDesc = "ImageDesc"
 details": [
 {
 "ImageURL": "https://duckduckgo.com/i/fd2dabcf.jpg",
 "ImageDesc": "Duck"
 },
 
 */
