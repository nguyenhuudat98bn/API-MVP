//
//  ViewControllerB.swift
//  AppDemo
//
//  Created by Dat Nguyen on 11/01/2022.
//

import UIKit

class ViewControllerB: UIViewController {
    var b: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.callApi()
        loadimg { img in
            
        } error: {
            
        }

        // Do any additional setup after loading the view.
    }
    
    func loadimg(completed: (UIImage?) -> Void, error: () -> Void) {
        if let a = b {
            completed(a)
            return
        }
        error()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
