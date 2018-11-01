//
//  SelectItemViewController.swift
//  OrderSoupOC
//
//  Created by Dawn Wang on 2018/10/26.
//  Copyright © 2018年 Dawn Wang. All rights reserved.
//

import UIKit

class SelectItemViewController: UIViewController {

    var titleString:String?
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = self.titleString;
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
