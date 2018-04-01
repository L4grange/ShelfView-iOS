//
//  ShelfCellView.swift
//  ShelfView
//
//  Created by Adeyinka Adediji on 11/09/2017.
//  Copyright © 2017 Adeyinka Adediji. All rights reserved.
//

import Foundation
import UIKit

class ShelfCellView: UICollectionViewCell {
	class func identifier() -> String { return String(describing: ShelfCellView.self) }

	var showTitle = false {
		didSet {
			updateTitleLabelVisibility()
		}
	}

	let titleLabel = UILabel()
	let subtitleLabel = UILabel()

    let shelfBackground = UIImageView()
    let bookBackground = UIView()
    let bookCover = UIImageView()
    let indicator = UIActivityIndicatorView()
    let spine = UIImageView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        addSubview(shelfBackground)
        addSubview(bookBackground)

        bookBackground.addSubview(bookCover)  
        bookBackground.addSubview(spine)
        bookBackground.addSubview(indicator)
        
        bookCover.layer.shadowColor = UIColor.black.cgColor
        bookCover.layer.shadowRadius = 10
        bookCover.layer.shadowOffset = CGSize(width: 0, height: 0)
        bookCover.layer.shadowOpacity = 0.7
        
        indicator.color = .magenta
        spine.image = Utils().loadImage(name: "spine")
        spine.isHidden = true
        shelfBackground.isUserInteractionEnabled = true
        bookCover.isUserInteractionEnabled = true

		setupLabels()
    }

	private func setupLabels() {
		self.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		subtitleLabel.translatesAutoresizingMaskIntoConstraints = false

		titleLabel.numberOfLines = 2
		titleLabel.textColor = .white
		titleLabel.adjustsFontSizeToFitWidth = true
		titleLabel.font = UIFont.boldSystemFont(ofSize: 14.0)

		subtitleLabel.numberOfLines = 1
		subtitleLabel.textColor = .white
		subtitleLabel.adjustsFontSizeToFitWidth = true
		subtitleLabel.textAlignment = .center
		subtitleLabel.font = UIFont.boldSystemFont(ofSize: 11.0)

		bookBackground.addSubview(titleLabel)
		bookBackground.addSubview(subtitleLabel)

		//Label constraints
		if #available(iOS 9.0, *) {
			titleLabel.centerYAnchor.constraint(equalTo: bookBackground.centerYAnchor, constant: -25.0).isActive = true
			titleLabel.leftAnchor.constraint(equalTo: bookBackground.leftAnchor, constant: 20.0).isActive = true
			titleLabel.rightAnchor.constraint(equalTo: bookBackground.rightAnchor, constant: -16.0).isActive = true

			subtitleLabel.bottomAnchor.constraint(equalTo: bookBackground.bottomAnchor, constant: -16.0).isActive = true
			subtitleLabel.leftAnchor.constraint(equalTo: bookBackground.leftAnchor, constant: 20.0).isActive = true
			subtitleLabel.rightAnchor.constraint(equalTo: bookBackground.rightAnchor, constant: -16.0).isActive = true
		} else {
			// Fallback on earlier versions (TODO? Does anyone still support iOS 8?)
		}
	}

	private func updateTitleLabelVisibility() {
		titleLabel.isHidden = !showTitle
		subtitleLabel.isHidden = !showTitle
	}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
