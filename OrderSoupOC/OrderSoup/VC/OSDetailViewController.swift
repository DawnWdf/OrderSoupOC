//
//  OSDetailViewController.swift
//  OrderSoupOC
//
//  Created by Dawn Wang on 2018/10/22.
//  Copyright © 2018年 Dawn Wang. All rights reserved.
//

import UIKit


class OSDetailViewController: UIViewController {
    
    @objc public var orderDetail:OSOrder!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white;
        
        let button:UIButton = UIButton.init(type: .custom);
        button.setTitle("donate a shortcut", for: .normal);
        button.setTitleColor(UIColor.red, for: .normal)
        button.frame = CGRect.init(x: 50, y: 100, width: 200, height: 50);
        button.layer.cornerRadius = 10;
        button.layer.borderColor = UIColor.blue.cgColor;
        button.layer.borderWidth = 1.0
        button.addTarget(self, action: #selector(donateAShortcut(sender:)), for: .touchUpInside)
        self.view.addSubview(button);
    }
    

    @objc func donateAShortcut(sender:UIButton?){
        
        OrderSoupIntentManager.orderSoupIntent().donateShortcut(with: self.orderDetail)
    
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
