//
//  File.swift
//  ValidMovie
//
//  Created by OSCAR DAZA on 3/09/18.
//  Copyright © 2018 OSCAR DAZA. All rights reserved.
//

import Foundation
import  UIKit

func GetMovieClass(controller:UIViewController, query:String,Ok:@escaping ((MovieSearchObject) -> Void))
{
    let ws = Ws()
    ws.getDictionary(view: controller, Ok: {ObjResponse in
        
        
        let Tetirement = MovieSearchObject(dic: ObjResponse)
        
        
        Ok(Tetirement)
    }, Error: {errer in
        let alert = UIAlertController(title: "Apreciado Cliente", message: errer, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    },
        todoEndpointt: BASEURL + "/search/keyword?query=\(query)&api_key=12956a722c68d23f60961096eaebdd15"
    )
    
}

