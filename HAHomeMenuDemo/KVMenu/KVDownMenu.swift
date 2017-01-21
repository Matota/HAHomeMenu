//
//  ContainViewController.swift
//  HAHomeMenu
//
//  Created by  Hitesh Ahuja on 2016/4/11.
//  Copyright © 2016 Hitesh Ahuja. All rights reserved.
//

import UIKit

class KVDownMenu: UIViewController {

    var contentViewController:UIViewController?
    var menuViewController:UIViewController = UIViewController()
    let slideDownTransitionAnimator = SlideDownTransitionAnimator()
    fileprivate var containerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        containerView.frame = self.view.bounds
        self.view.addSubview(containerView)
        
        if let _contentViewController = self.contentViewController {
            self.changeContentViewController(_contentViewController)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    func showMenu() {
        menuViewController.transitioningDelegate = slideDownTransitionAnimator
        self.present(menuViewController, animated: true, completion: nil)
    }
    
    func hideMenu() {
        if ((self.isViewLoaded == true) && (self.view.window != nil)) {
            return
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func changeContentViewController(_ contentViewController:UIViewController){
        
        if let _contentViewController = self.contentViewController {
            
            //remove old
            _contentViewController.view.removeFromSuperview()
            _contentViewController.willMove(toParentViewController: nil)
            _contentViewController.removeFromParentViewController()
            
            //add new
            self.contentViewController = contentViewController
            self.contentViewController!.view.frame = self.view.bounds
            self.containerView.addSubview(self.contentViewController!.view)
            self.addChildViewController(self.contentViewController!)
            self.contentViewController?.didMove(toParentViewController: self)
            
        }else{
            self.contentViewController = contentViewController
        }
    }
    
    
    func changeContentViewControllerAndDismissMenu(_ contentViewController:UIViewController){
        
        
        if let _contentViewController = self.contentViewController {
            
            //remove old
            _contentViewController.view.removeFromSuperview()
            _contentViewController.willMove(toParentViewController: nil)
            _contentViewController.removeFromParentViewController()
            
            
            self.dismiss(animated: true) {
                //add new
                self.contentViewController = contentViewController
                self.contentViewController!.view.frame = self.view.bounds
                self.containerView.addSubview(self.contentViewController!.view)
                self.addChildViewController(self.contentViewController!)
                self.contentViewController?.didMove(toParentViewController: self)
                
            }
        }
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
