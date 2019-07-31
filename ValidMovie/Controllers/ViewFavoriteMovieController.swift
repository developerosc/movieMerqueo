//
//  ViewFavoriteMovieController.swift
//  ValidMovie
//
//  Created by OSCAR DAZA on 30/07/19.
//  Copyright © 2018 OSCAR DAZA. All rights reserved.
//

import UIKit

class ViewFavoriteMovieCell: UITableViewCell {
    
    @IBOutlet var lbNameFavorite: UILabel!
    
    func Favorite(infoFull:String){
        
        lbNameFavorite.text = infoFull
    }
}

class ViewFavoriteMovieController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var tbFavorite: UITableView!
    var totalFavorite = 0
    var arrayFavorite = [String]()
    let defaults = UserDefaults.standard
    var cellIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColorFromRGB(rgbValue:  0x0189CD)
        let logo = UIImage(named: "tittleMerq")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        totalFavorite = self.defaults.integer(forKey: "num")

        if(totalFavorite != 0){
        for i in 1...totalFavorite{
            if((self.defaults.string(forKey: String(i))) != nil){
            arrayFavorite.append(self.defaults.string(forKey: String(i))!)
            }
        }
        
        self.tbFavorite.delegate = self
        self.tbFavorite.dataSource = self
        self.tbFavorite.reloadData()
        
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayFavorite.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ViewFavoriteMovieCell
        
        let Name = self.arrayFavorite[indexPath.row]
        
        cell.Favorite(infoFull: Name)
        
        //    cell.textLabel?.text = arrayContratos.Number as String
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
                //First remove file from DocumentDirectory
            
            for i in 1...self.totalFavorite{
                var hola = (self.defaults.string(forKey: String(i)))
                var hola1 = (self.arrayFavorite[indexPath.row])
                if((self.defaults.string(forKey: String(i))) != nil){
                    if((self.defaults.string(forKey: String(i)))?.isEqual(self.arrayFavorite[indexPath.row]))!{
                        self.defaults.removeObject(forKey: String(i))
                        self.defaults.synchronize()
                    }}
                
            }
                
            try? FileManager.default.removeItem(atPath: self.arrayFavorite[indexPath.row])
                //Remove object from array
                
            self.arrayFavorite.remove(at: indexPath.row)
                //Reload tableView
            
            self.tbFavorite.reloadData()

            
            
            
        }

        
        return [delete]
        
        
        
    }
    
}
