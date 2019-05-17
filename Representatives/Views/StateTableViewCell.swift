//
//  StateTableViewCell.swift
//  Representatives
//
//  Created by winston salcedo on 5/16/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

import UIKit

protocol StateTableViewCellDelegate {
}

class StateTableViewCell: UITableViewCell {

    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    
    var delegate: StateTableViewCellDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    
    
    func updateViews() {
        guard let representative = representative else { return }
            self.districtLabel.text = representative.district
            self.linkLabel.text = representative.link
            self.nameLabel.text = representative.name
            self.partyLabel.text = representative.party
            self.phoneLabel.text = representative.phone
        
    }
}
