//
//  ImageViewController.swift
//  MobileUpGallery
//
//  Created by Erkhaan on 27.07.2021.
//

import UIKit

class ImageViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!

	var image: UIImage?

	override func viewDidLoad() {
        super.viewDidLoad()
		setNavigationItem()
		setImageView()
		setSaveButton()
        // Do any additional setup after loading the view.
    }

	func setNavigationItem(){
		navigationItem.title = "Some data"
	}

	func setImageView(){
		guard let image = image else { return }
		imageView.image = image
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
