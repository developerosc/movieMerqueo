//
//  File.swift
//  ValidMovie
//
//  Created by OSCAR DAZA on 3/09/18.
//  Copyright © 2018 OSCAR DAZA. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

import Foundation
import UIKit

class Ws : NSObject
{
    func get(view: UIViewController , Ok: @escaping((NSArray)->Void)){
        
        request("URLConvertible", headers: nil)
            .responseData { response in
            
                if response.response?.statusCode == 200 {
                    
                    if let data = response.data{
                    var json:NSArray?
                    
                    
                    do {
                        json = try JSONSerialization.jsonObject(with: data, options: []) as! NSArray
                    }catch{
                        
                    }
                    
                        DispatchQueue.global(qos: .userInitiated).async {
                            DispatchQueue.main.async {
                                Ok(json!)
                            }
                        }
                }
                }
    }
    }
    
    func getArray(view: UIViewController, Ok: @escaping ((NSArray) -> Void),Error : @escaping((String) -> Void), todoEndpointt:(String))
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vcspinner = storyboard.instantiateViewController(withIdentifier: "SpinnerController") as! SpinnerController
        vcspinner.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        view.present(vcspinner, animated: true)
        let todoEndpoint = todoEndpointt
        
        request(todoEndpoint, headers: nil)
            .responseData { response in
                //             let answerArray = response.response?.statusCode
                //               vcspinner.hideSpinner()
                if response.response?.statusCode == 200{
                    if let data = response.data{
                        let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                        var err: NSError?
                        var json:NSArray?// = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves) as? NSDictionary
                        do {
                            json = try JSONSerialization.jsonObject(with: data, options: []) as! NSArray
                            // use anyObj here
                        } catch {
                            //Error( "\(error)")
                            return
                                print("json error: \(error)")
                        }
                        print("error: \(json)")
                        DispatchQueue.global(qos: .userInitiated).async {
                            // Bounce back to the main thread to update the UI
                            DispatchQueue.main.async {
                                Ok(json!)
                            }
                        }}
                    else {
                        let status = response.response?.statusCode
                    }
                    vcspinner.hideSpinner()
                }
                else
                {
                    if let ensaje = response.result.error
                    {
                        Error(ensaje.localizedDescription)
                    }
                    else
                    {
                        Error("En este momento estamos presentando problemas de comunicación. Por favor intente más tarde.")
                        vcspinner.hideSpinner()
                    }
                }
        }
    }
    
    func getDictionary(view: UIViewController, Ok: @escaping ((NSDictionary) -> Void),Error : @escaping((String) -> Void), todoEndpointt:(String))
    {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let todoEndpoint = todoEndpointt
        request(todoEndpoint, headers: nil)
            .responseData { response in
                //               let answer = response.response?.statusCode
                if response.response?.statusCode == 200{
                    
                    if let data = response.data{
                        
                        let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                        var err: NSError?
                        var json:NSDictionary?// = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves) as? NSDictionary
                        
                        do {
                            json = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                            // use anyObj here
                        } catch {
                            //Error( "\(error)")
                            return
                                print("json error: \(error)")
                        }
                        
                        print("error: \(json)")
                        
                        
                        DispatchQueue.global(qos: .userInitiated).async {
                            
                            // Bounce back to the main thread to update the UI
                            DispatchQueue.main.async {
                                Ok(json!)
                                
                            }
                        }}
                    else {
                        
                        let status = response.response?.statusCode
                        
                    }
                    
                }
                else
                {
                    if let ensaje = response.result.error
                    {
                        Error(ensaje.localizedDescription)
                    }
                    else
                    {
                           Error("En este momento estamos presentando problemas de comunicación. Por favor intente más tarde.")
                        
                    }
                    
                }
                
                
        }
        
    }
    
    
}
