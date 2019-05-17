//
//  StateDetailTableViewController.swift
//  Representatives
//
//  Created by winston salcedo on 5/16/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController, StateTableViewCellDelegate {

    var representatives: [Representative] = [] {
        didSet {
            tableView.reloadData()
            print(representatives)
        }
    }
    
    var state: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let state = state else { return }
        RepresentativesController.searchRepresentativesFor(state: state) { (representative) in
            
            DispatchQueue.main.async {
               self.representatives = representative
            }
        }
        
    
 }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as?  StateTableViewCell
        let representative = representatives[indexPath.row]
        cell?.representative = representative
        cell?.delegate = self
        cell?.updateViews()
        
        return cell ?? UITableViewCell()
    }
    
}
