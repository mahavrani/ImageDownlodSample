//
//  ImageTableViewCell.swift
//  ImageDownlodSample
//
//  Created by maharani.s on 12/22/17.
//  Copyright © 2017 Macadmin. All rights reserved.
//

import UIKit

let imageTableViewCell = "ImageTableViewCell"
class ImageTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var imgText: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
