//
//  ViewDetailMovieController.swift
//  ValidMovie
//
//  Created by OSCAR DAZA on 30/07/19.
//  Copyright © 2018 OSCAR DAZA. All rights reserved.
//

import UIKit

class ViewDetailMovieController: UIViewController {

    @IBOutlet var imgMovie: UIImageView!
    
    
    @IBOutlet var txDetail: UITextView!
    @IBOutlet var blTitleMovie: UILabel!
    
    var infocell = MovieSearchResultsObject(dic: ["":""])
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "title")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView

        GetArrayMovieDetail(controller: self, id: String(infocell.id),Ok: {rest in
            
            

            if(!(rest.poster_path.isEmpty)){
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(rest.poster_path)")
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            self.imgMovie.image = UIImage(data: data!)
            }else{
                self.imgMovie.image = UIImage(named:"notimg")
            }
            self.blTitleMovie.text = rest.original_title
            self.txDetail.text = rest.overview
            
            
            
            
        })
        
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
