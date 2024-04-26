//
//  SimpleTableViewCell.swift
//  PaginationApp
//
//  Created by localuser on 26/04/24.
//

import Foundation
import UIKit

class SimpleTableViewCell: UITableViewCell {
    let lablId = UILabel()
    let lablTitle = UILabel()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let containerView: UIView = {
        // wrapper to contain all the subviews for the UITableViewCell
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:   reuseIdentifier)
        
        contentView.addSubview(containerView)
        containerView.addSubview(lablId)
        containerView.addSubview(lablTitle)
        lablId.lineBreakMode = .byTruncatingTail
        
        
        lablTitle.lineBreakMode = .byTruncatingTail
        lablTitle.numberOfLines = 3
        var constraints = [NSLayoutConstraint]()
        
        lablId.translatesAutoresizingMaskIntoConstraints = false
        lablTitle.translatesAutoresizingMaskIntoConstraints = false

        constraints.append(contentsOf: [
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        constraints.append(contentsOf: [
            lablId.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 5.0),
            lablId.heightAnchor.constraint(equalToConstant: 18.0),
            lablId.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 5),
            lablId.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        constraints.append(contentsOf: [
            lablTitle.topAnchor.constraint(equalTo: lablId.bottomAnchor,constant:4.0),
            lablTitle.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant:-4.0),
            lablTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 5),
            lablTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate(constraints)
        
//        lablTitle.lineBreakMode = .byWordWrapping
//        lablTitle.numberOfLines = 0
//        lablId.numberOfLines = 0
//        
//        lablId.translatesAutoresizingMaskIntoConstraints = false
//        lablTitle.translatesAutoresizingMaskIntoConstraints = false
//        
//        self.lablId.topAnchor.constraint(equalTo: topAnchor,constant: 5).isActive = true
//        self.lablId.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
//        self.lablId.trailingAnchor.constraint(equalTo: self.lablTitle.leadingAnchor, constant: -16).isActive = true
//        self.lablId.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        
//        
//        self.lablTitle.topAnchor.constraint(equalTo: topAnchor,constant: 5).isActive = true
//        self.lablTitle.leadingAnchor.constraint(equalTo: self.lablId.trailingAnchor, constant: 10).isActive = true
//        self.lablTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
//        self.lablTitle.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
