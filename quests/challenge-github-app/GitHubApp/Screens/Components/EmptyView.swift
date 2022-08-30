//
//  EmptyView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 01/08/22.
//

import Foundation
import UIKit

final class EmptyView: UIView, ViewConfiguration {
    
    private var emptyMessageLabel: UILabel = {
        
        let label = UILabel()
        label.text = "No repositories found"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }()

    private var descriptionMessageLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Search for users to see their public repositories here!"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.systemGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()

    private lazy var stackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    func buildSubviews() {

        addSubview(stackView)
        stackView.addArrangedSubview(emptyMessageLabel)
        stackView.addArrangedSubview(descriptionMessageLabel)
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        setupSubviews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {
        
        self.backgroundColor = .white

    }
    
    func configureConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
    }
    
}
