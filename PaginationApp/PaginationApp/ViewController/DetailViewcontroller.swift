//
//  DetailViewcontroller.swift
//  PaginationApp
//
//  Created by localuser on 26/04/24.
//

import Foundation
import UIKit

class DetailViewcontroller: UIViewController {
    
    var postDetail: String?
    var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
    override func loadView() {
        view = UIView()
        
        detailLabel = UILabel()
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.textAlignment = .left
        detailLabel.numberOfLines = 0
        detailLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        detailLabel.sizeToFit()
        detailLabel.text = postDetail ?? " "
        
        view.addSubview(detailLabel)
        
        NSLayoutConstraint.activate([
            detailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            detailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            detailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            detailLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
