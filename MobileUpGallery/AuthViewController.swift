//
//  AuthViewController.swift
//  MobileUpGallery
//
//  Created by Erkhaan on 27.07.2021.
//

import UIKit

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		setButtonSettings()
		titleLabel.text = "Mobile Up\nGallery"
        // Do any additional setup after loading the view.
    }

	@IBOutlet weak var titleLabel: UILabel!
	

	@IBOutlet weak var authButton: UIButton!

	@IBAction func buttonTapped(_ sender: Any) {
		let collectionViewController = GalleryCollectionViewController(collectionViewLayout: GalleryCollectionViewController.generateLayout())
		collectionViewController.navigationItem.title = "Mobile Up Gallery"
		let navigationController = UINavigationController(rootViewController: collectionViewController)
		navigationController.modalPresentationStyle = .fullScreen
		present(navigationController, animated: true, completion: nil)
	}

	func setButtonSettings(){
		//authButton.layer.cornerRadius = 5
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
