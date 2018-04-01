//
//  BookModel.swift
//  ShelfView
//
//  Created by Adeyinka Adediji on 11/09/2017.
//  Copyright © 2017 Adeyinka Adediji. All rights reserved.
//

import Foundation

public class BookModel {
    
    var bookCoverSource: String?
    var bookCoverImage: UIImage?
    var bookId: String!
    var bookTitle: String!
    var bookSubtitle: String?

	/**
	Creates a new Book.

	- bookCoverSource: String? The cover Source. Can be nil, if an image is provided instead
	- bookCoverImage: UIImage? A cover UIImage. Can be nil, only if the bookCoverSource is set.
	- bookId: String The book's ID.
	- bookTitle: String The book's title.
	- bookSubtitle: String? The book's subtitle. Can be nil.
	*/
	public init(bookCoverSource: String? = nil, bookCoverImage: UIImage? = nil , bookId: String, bookTitle: String, bookSubtitle: String? = nil) {
        self.bookCoverSource = bookCoverSource
        self.bookCoverImage = bookCoverImage
        self.bookId = bookId
        self.bookTitle = bookTitle
        if (bookCoverSource?.isEmpty ?? true && bookCoverImage == nil) || bookId.isEmpty || bookTitle.isEmpty {
//        if bookId.isEmpty || bookTitle.isEmpty {
            fatalError("bookCoverSource/bookCoverImage/bookId/bookTitle must not be empty")
        }

//		if bookCoverSource?.isEmpty ?? true && bookCoverImage == nil {
//			//Generate a book cover gradient image
//
//			let colorHash = PFColorHash()
//			let hash = colorHash.hex("Hello World") // '#8696c4'
//
		//			//TODO: generate the cover gradient image here: (may be implemented later)
//
//			//color hash: https://github.com/PerfectFreeze/PFColorHash
//			//programmatic gradient: https://stackoverflow.com/questions/23074539/programmatically-create-a-uiview-with-color-gradient
//			//UIImage from gradient layer: https://stackoverflow.com/questions/16788305/how-to-create-uiimage-with-vertical-gradient-using-from-color-and-to-color
//		}

		self.bookSubtitle = bookSubtitle
    }
    
}
