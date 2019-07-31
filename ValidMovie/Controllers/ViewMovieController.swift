//
//  ViewMovieController.swift
//  ValidMovie
//
//  Created by OSCAR DAZA on 3/09/18.
//  Copyright © 2018 OSCAR DAZA. All rights reserved.
//

import UIKit

class ViewMovieCell: UITableViewCell {
    
    @IBOutlet var lbTitleMovie: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    
    
    func Result(infofull:MovieSearchResultsObject,dataImg:Data){
        
        lbTitleMovie.text = infofull.name
        print(infofull.name)
        self.imgLogo.image = UIImage(data: dataImg)
    }
}

class ViewMovieController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tbmovies: UITableView!
    
    let defaults = UserDefaults.standard
    var num = 0
    var cellIdentifier = "Cell"
    var infoResult = [MovieSearchResultsObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        num = self.defaults.integer(forKey: "num")
        
        navigationController?.navigationBar.barTintColor = UIColorFromRGB(rgbValue:  0x0189CD)
        
        let logo = UIImage(named: "tittleMerq")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
   
            
            self.tbmovies.delegate = self
            self.tbmovies.dataSource = self
            self.tbmovies.reloadData()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {

        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.infoResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ViewMovieCell
        
        let arrayResult =   self.infoResult[indexPath.row]
        print("id: \(infoResult[indexPath.row].id)")
        if(infoResult[indexPath.row].id != 0){
        GetArrayMovieDetail(controller: self, id: String(infoResult[indexPath.row].id),Ok: {rest in
            
            
            
      //      if(!(rest.poster_path.isEmpty)){
                let url = URL(string: "https://image.tmdb.org/t/p/w500\(rest.poster_path)")
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                //self.imgLogo.image = UIImage(data: data!)
                cell.Result(infofull: arrayResult, dataImg: data!)
         //   }
            
            
            
        })
            cell.Result(infofull: arrayResult, dataImg: UIImageJPEGRepresentation(UIImage(named:"logo")!, 1)!)
        }
    
        //    cell.textLabel?.text = arrayContratos.Number as String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewDetailMovieController") as! ViewDetailMovieController
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.infocell = infoResult[indexPath.row]
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

        }
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        /*
        let delete = UITableViewRowAction(style: .destructive, title: "Borrar") { (action, indexPath) in
            // delete item at indexPath

            
        }
        */
        let favorite = UITableViewRowAction(style: .default, title: "Favorite") { (action, indexPath) in
            
       
            
            if(self.num != 0){
              self.defaults.set(self.num+1, forKey: "num")
              num()
            }else{
                self.defaults.set(1, forKey: "num")
              num()
            }
            
            
        }
        func num(){
            self.num = self.defaults.integer(forKey: "num")
            self.defaults.set(self.infoResult[indexPath.row].name, forKey: String(self.num))
        }
        
        
        favorite.backgroundColor = UIColorFromRGB(rgbValue:  0x0189CD)
        
        return [favorite]
        
        
        
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
