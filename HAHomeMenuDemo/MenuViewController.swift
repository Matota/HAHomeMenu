//
//  MenuViewController.swift
//  HAHomeMenu
//
//  Created by Hitesh Ahuja on 2016/10/18.
//  Copyright © 2016 Hitesh Ahuja. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let imgDatas:[[String:String]] = {
        let bundle = Bundle.main
        if let path = bundle.path(forResource: "img", ofType: "json") {
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                do{
                    if let data = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves) as? [[String:String]] {
                        return data ////load img datas
                    }
                } catch {
                    //error
                }
            }
        }
        
        return []
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickCancelItem(_ sender: AnyObject) {
        //hide menu
        self.sideMenuViewController?.hideMenu()
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
        // MARK: - UITableViewDelegate, UITableViewDataSource
extension MenuViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imgDatas.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //ViewController
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let contentVC = mainStoryboard.instantiateViewController(withIdentifier: "NavDetail") as! UINavigationController
        let vc = contentVC.viewControllers.first as! DetailViewController
        vc.data = self.imgDatas[indexPath.row]
        
        //contentVC，Menu
        self.sideMenuViewController?.changeContentViewControllerAndDismissMenu(contentVC)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let menuCell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        let data = self.imgDatas[indexPath.row]
        let img = data["img"]
        let title = data["title"]
        let source = data["source"]
        
        menuCell.photoImageView.image = UIImage(named: img!)
        menuCell.titleLabel.text = title
        menuCell.sourceLabel.text = source
        
        return menuCell
    }
    
}




