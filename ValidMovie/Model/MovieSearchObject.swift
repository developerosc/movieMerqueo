//
//  File.swift
//  ValidMovie
//
//  Created by OSCAR DAZA on 3/09/18.
//  Copyright © 2018 OSCAR DAZA. All rights reserved.
//
import Foundation
import UIKit

class MovieSearchObject: NSObject {
    
    var page = 0
    var results = [MovieSearchResultsObject]()
    var total_pages = 0
    var total_results = 0
    
    
    
    init (dic:NSDictionary)
    {
        page = ValueJsonInt(dic: dic, key: "page")
        total_pages = ValueJsonInt(dic: dic, key: "total_pages")
        total_results = ValueJsonInt(dic: dic, key: "total_results")

        if let arrayresults = ValueJsonArray(dic: dic, key: "results"){
            
            for resultsdic in arrayresults{
                
                if let dicresults = resultsdic as? NSDictionary{
                    
                    results.append(MovieSearchResultsObject(dic : dicresults))
                }
                
                
            }
            
        }
        
    }
    
}
