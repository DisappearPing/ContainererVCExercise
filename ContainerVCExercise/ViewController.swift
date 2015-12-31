//
//  ViewController.swift
//  ContainerVCExercise
//
//  Created by disappearping on 2015/12/31.
//  Copyright © 2015年 disappear. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("blueVC") as! BlueViewController
    let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("greenVC")
    
    @IBOutlet weak var contentView: UIView!
    
    private var activeVC: UIViewController? {
        didSet{
            removeInactiveVC(oldValue)
            updateActiveVC()
        }
    }
    
    private func removeInactiveVC(inactiveVC:UIViewController?){
        if let inactiveVC = inactiveVC {
            inactiveVC.willMoveToParentViewController(nil)
            inactiveVC.removeFromParentViewController()
        }
    }
    
    private func updateActiveVC() {
        if let activeVC = activeVC {
            // call before adding child view controller's view as subview
            addChildViewController(activeVC)
            
            activeVC.view.frame = contentView.bounds
            contentView.addSubview(activeVC.view)
            
            // call before adding child view controller's view as subview
            activeVC.didMoveToParentViewController(self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        activeVC = vc1
    }

    @IBAction func segmentChange(sender: UISegmentedControl) {
        
        activeVC = sender.selectedSegmentIndex == 0 ? vc1 : vc2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

