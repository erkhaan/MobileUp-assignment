import UIKit
import Kingfisher

class ImageViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!

	var imageLink: String?

	override func viewDidLoad() {
        super.viewDidLoad()
		setImageView()
		setSaveButton()
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
		UIImageWriteToSavedPhotosAlbum(imageView.image!, nil, nil, nil)
	}
}
