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
		navigationItem.title = "Some data"
		guard let image = image else { return }
		imageView.image = image
        // Do any additional setup after loading the view.
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
