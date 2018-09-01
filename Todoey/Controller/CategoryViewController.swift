//
//  CategoryViewController.swift
//  Todoey
//
//  Created by sehajpal singh on 31/08/18.
//  Copyright © 2018 sehajpal singh. All rights reserved.
//

import UIKit
import  CoreData
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var categories : Results<Category>?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        load()
    }


    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newCategory = Category()
            
            newCategory.name = textField.text!
            
            
            self.save(category: newCategory)
            
        }
        
        alert.addTextField { (alertTextField) in
            textField = alertTextField
            textField.placeholder = "Create new item"

        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    //MARK - TableView Datasource Method
    
   
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories added yet"
        
        return cell
        
    }
    
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    //MARK - Data Manipulation Method
    
    func save(category : Category){
        do{
            try realm.write {
                realm.add(category)
            }
        }catch{
            print("Error saving data \(error)")
        }
        self.tableView.reloadData()
    }
    
    func load(){
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
    
}
