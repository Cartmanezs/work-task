//
//  FontsViewController.swift
//  work task
//
//  Created by Ingvar on 6/8/19.
//  Copyright © 2019 Igor. All rights reserved.
//

import UIKit

class FontsViewController: UIViewController {
    
    @IBOutlet weak var todoTableView: UITableView!
    
    var tableDataArray: [String] = []
    let todoCellIdentifier = "todoCellIdentifier"
    var checkedCells: [Bool]  = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.todoTableView.dataSource = self
        self.todoTableView.delegate = self
        
        tableDataArray = fontsListToArray()
        
        guard let savedCells = UserDefaults.standard.array(forKey: "checkedCells") else {
            checkedCells = [Bool](repeating: false, count: tableDataArray.count)
            return
            
        }
        self.checkedCells = savedCells as! [Bool]
    }
    
    func fontsListToArray() -> [String]{
        let familyNames = UIFont.familyNames
        
        for family in familyNames {
            print("Family name : \(family)")
            let fontNames = UIFont.fontNames(forFamilyName: family)
            
            for font in fontNames{
                print("Font name: \(font)")
            }
        }
        return familyNames
    }
}

extension FontsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: todoCellIdentifier, for: indexPath) as! TodoTableViewCell
        
        cell.taskLabel?.text = tableDataArray[indexPath.row]
        cell.taskLabel.font = UIFont(name: tableDataArray[indexPath.row], size: 26)
       
        let task = checkedCells[indexPath.row]
        
        if(task){
            cell.checkLabel.isHidden = false
        }
        return cell
    }
}

extension FontsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! TodoTableViewCell
        cell.checkLabel.isHidden = !cell.checkLabel.isHidden
    
        var task = checkedCells[indexPath.row]
        task = !task
        checkedCells[indexPath.row] = task
        UserDefaults.standard.set(checkedCells, forKey: "checkedCells")
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

