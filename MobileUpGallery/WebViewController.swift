import UIKit
import WebKit

protocol WebViewControllerDelegate: class{
	func gotToken(token: String)
}

class WebViewController: UIViewController {

	weak var delegate: WebViewControllerDelegate?
	private var webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
		setupWebView()
		makeRequest()
    }

	func setupWebView(){
		view.backgroundColor = .white
		webView.frame = self.view.bounds
		//webView.navigationDelegate = self
		view.addSubview(self.webView)
	}

	func makeRequest(){
		let authUrl = URL(string: "https://oauth.vk.com/authorize?client_id=7908959&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=photos&response_type=token&v=5.131")
		guard let url = authUrl else{
			print("wrong url")
			return
		}
		let request = URLRequest(url: url)
		webView.load(request)
	}

}

/*extension WebViewController: WKNavigationDelegate{

}*/
