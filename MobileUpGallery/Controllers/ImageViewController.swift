//
//  ImageViewController.swift
//  MobileUpGallery
//
//  Created by Erkhaan on 27.07.2021.
//

import UIKit
import Kingfisher

class ImageViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!

	//var image: UIImage?
	var imageLink: String?

	override func viewDidLoad() {
        super.viewDidLoad()
		setNavigationItem()
		setImageView()
		setSaveButton()
    }

	func setNavigationItem(){
		//navigationItem.title = "Some data"
	}

	func setImageView(){
		guard let link = imageLink else{
			print("imageLink is nil")
			return
		}
		let targetUrl = URL(string: link)
		guard let url = targetUrl else {
			print("wrong imageView url")
			return
		}
		print(link)
		imageView.kf.setImage(with: url)
	}

	func setSaveButton(){
		let saveButton = UIBarButtonItem()
		saveButton.image = UIImage(systemName: "square.and.arrow.up")
		saveButton.tintColor = .black
		saveButton.action = #selector(saveImageToGallery(sender:))
		saveButton.target = self

		navigationItem.setRightBarButton(saveButton, animated: true)
	}

	@objc func saveImageToGallery(sender: UIBarButtonItem) {
		print("button click")
		UIImageWriteToSavedPhotosAlbum(imageView.image!, nil, nil, nil)
	}
}
