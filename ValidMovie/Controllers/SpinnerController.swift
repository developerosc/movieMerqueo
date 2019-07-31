//
//  SpinnerController.swift
//  ValidMovie
//
//  Created by OSCAR DAZA on 3/09/18.
//  Copyright © 2018 OSCAR DAZA. All rights reserved.
//

import Foundation
import UIKit

class SpinnerController : UIViewController
{
    
    @IBOutlet weak var vBack: UIView!
    @IBOutlet weak var sppCargando: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sppCargando.startAnimating()
        vBack.layer.cornerRadius = 5.0
        
    }
    
    func hideSpinner()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    func hideSpinnerCompletion(Ok :@escaping (() -> Void))
    {
        self.dismiss(animated: true, completion:
            {
                Ok()
        })
    }
}
