//
//  ViewController.swift
//  UITableViewExample
//
//  Created by Yusuf Yigit on 24.12.2018.
//  Copyright © 2018 Yusuf Yigit. All rights reserved.
//

import UIKit

class tableList: UITableViewController {

    var textField = UITextField()
    var itemArray = ["Find Milk","Drive Car","Earn Money"]
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        if let items =  defaults.array(forKey: "TableViewArray") as? [String] {
            itemArray = items
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableListCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //TableView Delegate Method
    
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // ADD BUTTON
    @IBAction func addButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if(self.textField.text != ""){
            self.itemArray.append(self.textField.text!)
            }
                self.defaults.set(self.itemArray, forKey: "TableViewArray")
                self.tableView.reloadData()
            
        }
        alert.addTextField { (alertTextField) in alertTextField.placeholder = "Create new Item"
            self.textField = alertTextField
            
        }
        alert.addAction(action)
        
        present(alert,animated: true,completion: nil)
        
        
    }
}


