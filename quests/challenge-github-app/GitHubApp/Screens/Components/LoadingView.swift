//
//  LoadingView.swift
//  GitHubApp
//
//  Created by clarice aragão on 22/08/22.
//

import Foundation
import UIKit

final class LoadingView: UIView, ViewConfiguration {
    
    private var loadingViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Searching repositories…"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }()
    
    private var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 14
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    func buildSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(loadingViewLabel)
        stackView.addArrangedSubview(activityIndicator)
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

extension LoadingView {
    
    func updateView(with configuration: LoadingViewConfiguration) {
        self.loadingViewLabel.text = configuration.description
    }
}
