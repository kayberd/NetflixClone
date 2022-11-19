//
//  Extensions.swift
//  NetflixClone
//
//  Created by Berkay Demirören on 19.11.2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst(1)
    }
}
