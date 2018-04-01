//
//  ViewController.swift
//  ShelfView
//
//  Created by tdscientist on 09/23/2017.
//  Copyright (c) 2017 tdscientist. All rights reserved.
//
 
import ShelfView

class ViewController: UIViewController, ShelfViewDelegate {
    
    let statusBarHeight =  UIApplication.shared.statusBarFrame.height
    var shelfView:ShelfView!
    var bookModel = [BookModel] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ** //
        shelfView = ShelfView(frame: CGRect(x: 0, y: 0, width: deviceScreenWidth(), height: deviceScreenHeight()))
        // ** //
		bookModel.append(BookModel.init(bookCoverSource: "http://www.aidanf.net/images/learn-swift/cover-web.png", bookId: "0", bookTitle: "Learn Swift"))
        bookModel.append(BookModel.init(bookCoverSource: "https://images-na.ssl-images-amazon.com/images/I/41bUdNhz6pL._SX346_BO1,204,203,200_.jpg", bookId: "1", bookTitle: "Beginning iOS"))
        bookModel.append(BookModel.init(bookCoverSource: "https://www.packtpub.com/sites/default/files/1414OS_5764_Mastering%20Swift%203%20-%20Linux.jpg", bookId: "2", bookTitle: "Mastering Swift 3 - Linux"))
        bookModel.append(BookModel.init(bookCoverSource: "https://files.kerching.raywenderlich.com/uploads/c7f72825-5849-4d76-ba21-8d9486296119.png", bookId: "3", bookTitle: "iOS Apprentice"))

		bookModel.append(BookModel(bookCoverSource: "http://www.aidanf.net/images/learn-swift/cover-web.png", bookCoverImage: #imageLiteral(resourceName: "gradient"), bookId: "4", bookTitle: "UIImage Book Cover", bookSubtitle: "With a subtitle"))

        // ** //
		shelfView.loadData(bookModel: bookModel, bookSource: .url)
        // ** //
        delay(3){
            self.bookModel.append(BookModel.init(bookCoverSource: "https://www.packtpub.com/sites/default/files/5723cov_.png", bookId: "4", bookTitle: "Learning Xcode 8"))
            self.bookModel.append(BookModel.init(bookCoverSource: "https://files.kerching.raywenderlich.com/uploads/bc41c949-c745-455e-8922-1b196fcf5e80.png", bookId: "5", bookTitle: "iOS Animations"))
            self.bookModel.append(BookModel.init(bookCoverSource: "http://www.appsmith.dk/wp-content/uploads/2014/12/cover-small.jpg", bookId: "6", bookTitle: "Beginning iOS Development"))
            self.shelfView.updateData(bookModel: self.bookModel)
        }
        // ** //
        delay(5){
            self.bookModel.append(BookModel.init(bookCoverSource: "https://codewithchris.com/img/SwiftCourseThumbnail_v2.jpg", bookId: "7", bookTitle: "How To Make iPhone Apps"))
            self.bookModel.append(BookModel.init(bookCoverSource: "http://whatpixel.com/images/2016/08/learning-swift-book-cover.jpg", bookId: "8", bookTitle: "Learning Swift"))
            self.bookModel.append(BookModel.init(bookCoverSource: "https://www.packtpub.com/sites/default/files/9781785288197.png", bookId: "9", bookTitle: "Learning iOS UI Development"))
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

		//Replaced delay(0) with the correct way to handle size changes
		coordinator.animate(alongsideTransition: { context in
			//Animation to be excecuted along the transition
			self.shelfView.resize(width: self.deviceScreenWidth(), height: self.deviceScreenHeight(), bookModel: self.bookModel)
		}) { context in
			//Animation to be excecuted after the completion, not needed here
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
    
}

