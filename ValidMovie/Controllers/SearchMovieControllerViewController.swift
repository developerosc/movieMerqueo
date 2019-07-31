//
//  SearchMovieControllerViewController.swift
//  ValidMovie
//
//  Created by OSCAR DAZA on 3/09/18.
//  Copyright © 2018 OSCAR DAZA. All rights reserved.
//

import UIKit

class SearchMovieControllerViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var txSearch: UITextField!
    var arraymovie = [MovieSearchResultsObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColorFromRGB(rgbValue:  0x0189CD)
        self.txSearch.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateViewMoving(up: true, moveValue: 150)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(up: false, moveValue: 150)
    }
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    var image: UIImage? = UIImage(named:"logo")?.withRenderingMode(.alwaysOriginal)
    
    @IBAction func triGoMovie(_ sender: UIButton) {
        
        if(txSearch.text?.isEmpty)!{
                let alert = UIAlertController(title: "Estimado Usuario", message: "No hay películas con esa letra o palabra", preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "Ok", style: .default)
                {
                    (action:UIAlertAction!) in
                }
                
                alert.addAction(OKAction)
                
                self.present(alert, animated: true, completion: nil)
        }else{
        arraymovie = [MovieSearchResultsObject]()
        
        GetMovieClass(controller: self, query: self.txSearch.text! ,Ok: {rest in
    
            for arrayresult in rest.results{
            self.arraymovie.append(arrayresult)
            }
            if(rest.results.isEmpty){
            let alert = UIAlertController(title: "Estimado Usuario", message: "No hay películas con esa letra o palabra", preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "Ok", style: .default)
            {
                (action:UIAlertAction!) in
            }
            
            alert.addAction(OKAction)
            
            self.present(alert, animated: true, completion: nil)
            }else{
                self.animateViewMoving(up: false, moveValue: 150)
                self.view.endEditing(true)
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewMovieController") as! ViewMovieController
                vc.infoResult = self.arraymovie
                vc.modalPresentationStyle = .overFullScreen
                vc.modalTransitionStyle = .crossDissolve
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            
        })
        
        }
        
    }
    
    @IBAction func triGoFavorite(_ sender: UIButton) {
        
        self.animateViewMoving(up: false, moveValue: 150)
        self.view.endEditing(true)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewFavoriteMovieController") as! ViewFavoriteMovieController
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
