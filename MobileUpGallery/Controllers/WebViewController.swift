import UIKit
import WebKit

protocol WebViewControllerDelegate: class{
	func gotToken(token: String,expire: String)
}

class WebViewController: UIViewController {

	weak var delegate: WebViewControllerDelegate?

	private var webView: WKWebView = WKWebView()

	override func viewDidLoad() {
        super.viewDidLoad()
		setupWebView()
		makeRequest()
    }

	func setupWebView(){
		view.backgroundColor = .white
		webView.frame = view.bounds
		view.addSubview(webView)
	}

	func makeRequest(){
		let authUrl = URL(string: "https://oauth.vk.com/authorize?client_id=7913148&display=mobile&redirect_uri=https://oauth.vk.com/blank.html&scope=photos&response_type=token&v=5.131")

		// https://oauth.vk.com/authorize?client_id=1&display=page&redirect_uri=http://example.com/callback&scope=friends&response_type=token&v=5.131&state=123456
		
		guard let url = authUrl else{
			print("wrong url")
			return
		}
		let request = URLRequest(url: url)
		webView.load(request)
		webView.navigationDelegate = self
	}
}

extension WebViewController: WKNavigationDelegate{
	func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
		if let url = navigationAction.request.url{
			let targetString = url.absoluteString.replacingOccurrences(of: "#", with: "?")
			if let components = URLComponents(string: targetString){
				let token = components.queryItems?.first(where: {$0.name == "access_token"})?.value
				if let token = token{
					let expireIn = components.queryItems?.first(where: {$0.name == "expires_in"})?.value//
					guard let expire = expireIn else{
						print("wrong expire_in")
						return
					}
					dismiss(animated: true, completion: nil)
					decisionHandler(.cancel)
					delegate?.gotToken(token: token,expire: expire)
					return
				}
			}
		}
		decisionHandler(.allow)
	}

	func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
		print("\(error)")
		dismiss(animated: true, completion: nil)
	}
}
