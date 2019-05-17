//
//  StateListTableViewController.swift
//  Representatives
//
//  Created by winston salcedo on 5/16/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        RepresentativesController.searchRepresentativesFor(state: "GA") { (representatives) in
            print(representatives)
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return States.all.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statesCell", for: indexPath)
        let state = States.all[indexPath.row]
        cell.textLabel?.text = state
        // Configure the cell...
        
        return cell
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailCell"  {
            guard let indexPath = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? StateDetailTableViewController else { return }
            let state = States.all[indexPath.row]
            destinationVC.state = state
        }
   }
    

}

