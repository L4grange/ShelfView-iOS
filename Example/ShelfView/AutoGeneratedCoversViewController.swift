//
//  AutoGeneratedCoversViewController.swift
//  ShelfView_Example
//
//  Created by Lucas Paul on 01/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import ShelfView

class AutoGeneratedCoversViewController: UIViewController, ShelfViewDelegate {

	let statusBarHeight =  UIApplication.shared.statusBarFrame.height
	var shelfView:ShelfView!
	var bookModel = [BookModel] ()

	override func viewDidLoad() {
		super.viewDidLoad()
		// ** //
		shelfView = ShelfView(frame: CGRect(x: 0, y: 0, width: deviceScreenWidth(), height: deviceScreenHeight()))
		// ** //
		bookModel.append(BookModel(bookCoverImage: generateCoverForBook(), bookId: "0", bookTitle: "Learn Swift", bookSubtitle: "I am a subtitle!"))
		bookModel.append(BookModel(bookCoverImage: generateCoverForBook(), bookId: "1", bookTitle: "Beginning iOS"))
		bookModel.append(BookModel(bookCoverImage: generateCoverForBook(), bookId: "2", bookTitle: "Mastering Swift 3"))
		bookModel.append(BookModel(bookCoverImage: generateCoverForBook(), bookId: "3", bookTitle: "iOS Apprentice"))

		//Or you can use a normal image from the App's assets:
		bookModel.append(BookModel(bookCoverImage: #imageLiteral(resourceName: "gradient"), bookId: "4", bookTitle: "UIImage Book Cover", bookSubtitle: "With a subtitle"))

		bookModel.append(BookModel(bookCoverImage: generateCoverForBook(), bookId: "3", bookTitle: "Auto generated Book Cover", bookSubtitle: "Gradient background"))
		// ** //
		shelfView.loadData(bookModel: bookModel, bookSource: .image, showTitleLabels: true) //Set the bookModel source as .image to load the images directly as the book cover
		// ** //
		delay(3){
			self.bookModel.append(BookModel(bookCoverImage: self.generateCoverForBook(), bookId: "5", bookTitle: "Learning Xcode 8"))
			self.bookModel.append(BookModel(bookCoverImage: self.generateCoverForBook(), bookId: "6", bookTitle: "iOS Animations"))
			self.bookModel.append(BookModel(bookCoverImage: self.generateCoverForBook(), bookId: "7", bookTitle: "Beginning iOS Development"))
			self.shelfView.updateData(bookModel: self.bookModel)
		}
		// ** //
		shelfView.delegate = self
		self.view.addSubview(shelfView)
	}

	func onBookClicked(_ shelfView: ShelfView, position: Int, bookId: String, bookTitle: String) {
		print("I just clicked \(bookTitle) with bookId \(bookId) @ position \(position)")
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransition(to: size, with: coordinator)

		coordinator.animate(alongsideTransition: { context in
			self.shelfView.resize(width: self.deviceScreenWidth(), height: self.deviceScreenHeight(), bookModel: self.bookModel)
		}) { context in
			//Completion
		}
	}

	func deviceScreenWidth() -> CGFloat {
		return UIScreen.main.bounds.width
	}

	func deviceScreenHeight() -> CGFloat{
		return UIScreen.main.bounds.height
	}

	func delay(_ delay: Double, closure: @escaping ()->()) {
		DispatchQueue.main.asyncAfter(
			deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
			execute: closure
		)
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}

	/**
	Generates a UIImage with a gradient using random colors
	You can replace the "random color" logic to be statit, e.g. depend on the book title string
	*/
	private func generateCoverForBook() -> UIImage {
		let colors: [UIColor] = [.green, .blue, .gray, .magenta, .purple, .orange, .red, .yellow, .cyan, .lightGray]

		let size = CGSize(width: view.bounds.width/2, height: view.bounds.height/2)
		let layer = CAGradientLayer()
		layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
		layer.colors = [colors.randomElement()!.cgColor, // start color
			(UIColor.black.cgColor)] // end color, you may also use a random one as well
		UIGraphicsBeginImageContext(size)
		if let aContext = UIGraphicsGetCurrentContext() {
			layer.render(in: aContext)
		}
		let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()

		return image!
	}

}

extension Collection where Index == Int {

	/**
	Picks a random element of the collection.

	- returns: A random element of the collection.
	*/
	func randomElement() -> Iterator.Element? {
		return isEmpty ? nil : self[Int(arc4random_uniform(UInt32(endIndex)))]
	}

}