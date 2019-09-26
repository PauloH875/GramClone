//
//  UIImageView+RemoteLoad.swift
//  CIA
//
//  Created by Paul Hulatt on 26/09/2019.
//  Copyright © 2019 Apptimal Ltd. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
