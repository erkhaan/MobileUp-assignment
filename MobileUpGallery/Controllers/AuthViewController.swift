import UIKit

class AuthViewController: UIViewController {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var authButton: UIButton!

	@IBAction func buttonTapped(_ sender: Any) {
		updateData()
	}

	private var token: String = ""
	private var expire: String = ""

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

	func fetchApi(token: String){
		DispatchQueue.main.async {
			ApiService.fetch(token: token){ response in
				// collectionView setup
				let collectionViewController = GalleryCollectionViewController(collectionViewLayout: UICollectionViewLayout())
				collectionViewController.navigationItem.title = "Mobile Up Gallery"
				collectionViewController.items = response

				// navigationController setup
				let navigationController = UINavigationController(rootViewController: collectionViewController)
				navigationController.modalPresentationStyle = .fullScreen
				self.present(navigationController, animated: true, completion: nil)
			}
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		let defaults = UserDefaults.standard
		token = defaults.string(forKey: "tokenKey")!
		expire = defaults.string(forKey: "expireKey")!
		if(!token.isEmpty){
			print("current token: \(token)")
			let tokenValidation = TokenValidation(token: token)
			tokenValidation.validateToken{result in
				if(result){
					print("token is valid, fetching...")
					self.fetchApi(token: self.token)
				}
			}
		}
		setButtonSettings()
		setLabelSettings()

	}

}

extension AuthViewController: WebViewControllerDelegate{
	func gotToken(token: String,expire: String) {
		self.token = token
		self.expire = expire
		let defaults = UserDefaults.standard
		defaults.set(token, forKey: "tokenKey")
		defaults.set(expire, forKey: "expireKey")
		defaults.synchronize()
		fetchApi(token: token)
	}
}
