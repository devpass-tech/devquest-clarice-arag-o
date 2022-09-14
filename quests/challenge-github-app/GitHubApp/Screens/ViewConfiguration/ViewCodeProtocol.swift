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
    func buildSubviews()
    func configureConstraints()
}

extension ViewConfiguration {
    func setupSubviews() {
        self.configureSubviews()
        self.buildSubviews()
        self.configureConstraints()

    }
}
