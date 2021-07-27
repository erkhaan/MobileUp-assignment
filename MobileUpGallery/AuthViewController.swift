import UIKit

class AuthViewController: UIViewController {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var authButton: UIButton!

	@IBAction func buttonTapped(_ sender: Any) {
		updateData()
	}

	private var token: String = ""

	func setLabelSettings(){
		titleLabel.text = "Mobile Up\nGallery"
	}

	func setButtonSettings(){
		authButton.layer.cornerRadius = 8
	}

	func updateData(){
		guard !token.isEmpty else{
			let webViewController = WebViewController()
			webViewController.delegate = self
			present(webViewController, animated: true, completion: nil)
			return
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		setButtonSettings()
		setLabelSettings()
	}

}

extension AuthViewController: WebViewControllerDelegate{
	func gotToken(token: String) {
		self.token = token
		print(token)
		let collectionViewController = GalleryCollectionViewController(collectionViewLayout: GalleryCollectionViewController.generateLayout())
		collectionViewController.navigationItem.title = "Mobile Up Gallery"
		let navigationController = UINavigationController(rootViewController: collectionViewController)
		navigationController.modalPresentationStyle = .fullScreen
		present(navigationController, animated: true, completion: nil)
	}
}
