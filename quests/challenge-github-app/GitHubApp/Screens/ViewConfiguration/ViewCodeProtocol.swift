//
//  ViewCodeProtocol.swift
//  GitHubApp
//
//  Created by clarice aragão on 22/08/22.
//

import Foundation

protocol ViewConfiguration: AnyObject {
    func setupSubviews()
    func configureSubviews()
    func buildViews()
    func configureConstraints()
}

extension ViewConfiguration {
    func setupSubviews() {
        self.configureSubviews()
        self.buildViews()
        self.configureConstraints()

    }
}
