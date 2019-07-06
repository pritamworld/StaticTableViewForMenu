//
//  ViewController.swift
//  StaticTableViewForMenu
//
//  Created by moxDroid on 2019-07-05.
//  Copyright © 2019 moxDroid. All rights reserved.
//

import UIKit

class CourseTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblCountryList: UITableView!
    @IBOutlet weak var txtCountryName: UITextField!
    
    var courseArray = ["Android Fundamentals", "iOS Fundamentals", "Swift Programming", "Database Design", "Programming in Java", "Web Development in PHP", "Machine Learning", "Data Analytics with R", "Learn Ruby - The Hard Way", "Data Structures in C++"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblCountryList.delegate = self
        self.tblCountryList.dataSource = self
        
        let rightButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.plain, target: self, action: #selector(   self.showEditing))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func showEditing(sender: UIBarButtonItem)
    {
        if(self.tblCountryList.isEditing == true)
        {
            self.tblCountryList.isEditing = false
            self.navigationItem.rightBarButtonItem?.title = "Edit"
        }
        else
        {
            self.tblCountryList.isEditing = true
            self.navigationItem.rightBarButtonItem?.title = "Done"
        }
    }
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.courseArray.remove(at: indexPath.row)
            self.tblCountryList.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.courseArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "couseCellIdentifier") as! UITableViewCell
        
        cell.textLabel?.text = self.courseArray[indexPath.row]
        
        return cell
    }
    

    @IBAction func btnAddCountryPressed(_ sender: UIButton)
    {
        if let txt = txtCountryName.text
        {
            self.courseArray.append(txt)
            
            self.tblCountryList.reloadData()
        }
    }
    
    @IBAction func segmentSorting(_ sender: UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0
        {
            self.courseArray.sort(by: <)
        }else{
             self.courseArray.sort(by: >)
        }
        
        self.tblCountryList.reloadData()
    }
}

