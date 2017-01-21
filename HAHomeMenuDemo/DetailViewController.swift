//
//  DetailViewController.swift
//  HAHomeMenu
//
//  Created by Hitesh Ahuja on 2016/10/18.
//  Copyright © 2016 Hitesh Ahuja. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    var data:[String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let img = data["img"] ?? ""
        let title = data["title"]
        let source = data["source"]
        
        self.title = title
        
        self.photoImageView.image = UIImage(named: img)
        self.titleLabel.text = title
        self.sourceLabel.text = source
        
    }

    @IBAction func clickMenuItem(_ sender: AnyObject) {
        //Show menu
        self.sideMenuViewController?.showMenu()
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
