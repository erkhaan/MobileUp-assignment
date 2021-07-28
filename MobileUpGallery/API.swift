//
//  API.swift
//  MobileUpGallery
//
//  Created by Erkhaan on 28.07.2021.
//

import Foundation
import Alamofire

class ApiService{
	func fetch(token: String/*, completion: @escaping (Response) -> Void*/){
		let url = "https://api.vk.com/method/photos.get?owner_id=-128666765&album_id=266276915&access_token=\(token)&v=5.131"

		AF.request(url).responseDecodable(of: Response.self) { response in
			debugPrint("Response: \(response)")
			//switch response.result{}
			/*guard let articles = response.value else{
				print("article download error")
				return
			}
			completion(articles.articles)*/
		}
	}
}
