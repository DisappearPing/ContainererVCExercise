//
//  ContainerViewController.swift
//  ContainerVCExercise
//
//  Created by disappearping on 2015/12/31.
//  Copyright © 2015年 disappear. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var PagedSegment: UISegmentedControl!
    @IBOutlet weak var contentView: UIView!
    
    var firstVC: UIViewController?
    var secondVC: UIViewController?
    
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

        // Do any additional setup after loading the view.
        activeVC = firstVC!
    }

    @IBAction func changeVCSegment(sender: UISegmentedControl) {
        
        activeVC = sender.selectedSegmentIndex == 0 ? firstVC : secondVC
        
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
