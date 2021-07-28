//
//  TokenValidation.swift
//  MobileUpGallery
//
//  Created by Erkhaan on 28.07.2021.
//

import Foundation

class TokenValidation{
	static let shared = TokenValidation()

	func validateToken(token: String) -> Bool{
		print(token)
		return true
	}
}
