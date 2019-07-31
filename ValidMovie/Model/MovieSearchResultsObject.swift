//
//  File.swift
//  ValidMovie
//
//  Created by OSCAR DAZA on 3/09/18.
//  Copyright © 2018 OSCAR DAZA. All rights reserved.
//
import Foundation
import UIKit

class MovieSearchResultsObject: NSObject {
    
    var id = 0
    var name = ""

    
    
    
    init (dic:NSDictionary)
    {
        id = ValueJsonInt(dic: dic, key: "id")
        name = ValueJsonString(dic: dic, key: "name")
    }
    
}
