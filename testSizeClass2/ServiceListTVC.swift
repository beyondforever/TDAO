//
//  ServiceListTVC.swift
//  testSizeClass2
//
//  Created by JerryYang on 11/28/15.
//  Copyright (c) 2015 JerryYang. All rights reserved.
//

import UIKit

class ServiceListTVC: UITableViewController {

    // default datas
    var datasource = [ServiceList]();

    override func viewDidLoad() {
        super.viewDidLoad()

        initDS(&datasource)
        
        self.navigationItem.title = "Request Service"
        self.navigationController?.navigationBar.titleTextAttributes = NSDictionary(object: UIColor.whiteColor(), forKey: NSForegroundColorAttributeName) as [NSObject : AnyObject]
        self.navigationController?.navigationBar.barTintColor = colorFromHexString("#0298d7")

        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.rowHeight = 50
        
        //此处代码是为了去掉多余的空白行
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
            
        self.tableView.reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return datasource.count;
    }

    /**
    initialize datasource of service list. so far, we set 4 default services.
    
    :param: inout [ServiceList]
    */
    func initDS(inout ds:[ServiceList])
    {
        let service1 = ServiceList()
        service1.serviceName = "HP Server Partner Program            "
        service1.serviceDescription = "This sis Partner's description"
        ds.append(service1)
        
        let service2 = ServiceList()
        service2.serviceName = "HP Helion CloudSystem 8.1 Environment"
        service2.serviceDescription = "This sis Partner's description"
        ds.append(service2)
        
        let service3 = ServiceList()
        service3.serviceName = "HP CloudSystem v7.2 Environment      "
        service3.serviceDescription = "This sis Partner's description"
        ds.append(service3)
        
        let service4 = ServiceList()
        service4.serviceName = "Linux & Windows Environment          "
        service4.serviceDescription = "This sis Partner's description"
        ds.append(service4)
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        if cell != nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        }
        
        let service = datasource[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.text = service.serviceName
        cell.textLabel?.numberOfLines = 0
        //cell.detailTextLabel?.text  = service.serviceDescription
        cell.imageView?.image = UIImage(named:"icon_1.png")

        return cell
    }

}
