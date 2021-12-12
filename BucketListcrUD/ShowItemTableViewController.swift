//
//  ShowItemTableViewController.swift
//  BucketListcrUD
//
//  Created by admin on 12/12/2021.
//

import UIKit

class ShowItemTableViewController: UITableViewController, AddItemDelegate {

    var list = ["Playing Football","Swim With Sharks","Getting Marred"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        cell.textLabel?.text = list[indexPath.section]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "AddSegue", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        list.remove(at: indexPath.section)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! UINavigationController
        let newViewController = destination.topViewController as! AddNewItemViewController
        newViewController.delegate = self
        if let indexPath = sender as? NSIndexPath {
            //let indexPath = sender as! NSIndexPath
            newViewController.item = list[indexPath.section]
            newViewController.indexPath = indexPath
        }
    }
    
    func addNewItem(item: String, at indexPath: NSIndexPath?) {
        if let ip = indexPath {
            list[ip.section] = item
        }
        else {
            list.append(item)
        }
        tableView.reloadData()
    }
}
