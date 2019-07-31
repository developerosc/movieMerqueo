//
//  getArrayMovie.swift
//  ValidMovie
//
//  Created by OSCAR DAZA on 30/07/19.
//  Copyright © 2018 OSCAR DAZA. All rights reserved.
//

import Foundation
import  UIKit

func GetArrayMovieDetail(controller:UIViewController, id:String, Ok:@escaping ((MovieArrayObject) -> Void))
{
    let ws = Ws()
    ws.getDictionary(view: controller, Ok: {ObjResponse in
        
        
        let Tetirement = MovieArrayObject(dic: ObjResponse)
        
        
        Ok(Tetirement)
    }, Error: {errer in
        
        let alert = UIAlertController(title: "Estimado Usuario", message: "En algunas películas no hay detalles ni imagen", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
 
    },
        todoEndpointt: BASEURL + "/movie/\(id)?api_key=12956a722c68d23f60961096eaebdd15&language=en-US&pageappend_to_response=1"
    )
}
