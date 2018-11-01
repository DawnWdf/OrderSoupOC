//
//  RandomListViewController.swift
//  OrderSoupOC
//
//  Created by Dawn Wang on 2018/10/24.
//  Copyright © 2018年 Dawn Wang. All rights reserved.
//

import UIKit

class RandomListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    
    public var listTableView : UITableView?
    
    var listData:NSMutableArray = ["多做运动","好好吃饭","多喝水"];
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let list = UITableView.init(frame: CGRect.zero, style: .plain)
        list.delegate = self
        list.dataSource = self
        list.register(UITableViewCell.self, forCellReuseIdentifier: "ListCell")
        self.view.addSubview(list)
        self.listTableView = list
        list.mas_makeConstraints { (make:MASConstraintMaker?) in
         make?.edges.equalTo()(self.view)
        }
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "selectItem" {
            let controller = segue.destination as! SelectItemViewController
            controller.titleString = sender as? String

        }
    }
    
    // MARK:- tableview datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.listData.count);
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        cell!.textLabel?.text = self.listData[indexPath.row] as? String
        return cell!
    }
    
    //MARK: - tableview delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let string = self.listData[indexPath.row]
        self.performSegue(withIdentifier: "selectItem", sender: string)
    }
    
    
    
    
    
}
