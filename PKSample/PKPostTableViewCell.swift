//
//  PKPostTableViewCell.swift
//  PKSample
//
//  Created by Uday Kumar Voleti on 22/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

import UIKit

class PKPostTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!
    
    //MARK: Life cycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: Custom Methods
    func configureCell(postObj: PKPostObj) {
        title.text = postObj.title
        body.text = postObj.body
    }

}
