//
//  ShelfModel.swift
//  ShelfView
//
//  Created by Adeyinka Adediji on 11/09/2017.
//  Copyright © 2017 Adeyinka Adediji. All rights reserved.
//

import Foundation

public enum ShelfType: String {
	case start
	case center
	case end
}

class ShelfModel {
    
    var bookCoverSource: String?
    var bookCoverSourceImage: UIImage?
    var bookId: String!
    var bookTitle: String!
    var bookSubtitle: String?
    var show: Bool!
    var position: ShelfType!

	init(bookCoverSource: String? = nil, bookCoverImage: UIImage? = nil, bookId: String, bookTitle: String, bookSubtitle: String? = nil, show: Bool, position: ShelfType) {
        self.bookCoverSource = bookCoverSource
        self.bookCoverSourceImage = bookCoverImage
        self.bookId = bookId
        self.bookTitle = bookTitle
		self.bookSubtitle = bookSubtitle
        self.show = show
        self.position = position
    }
    
}
