//
//  RepositoryCellView.swift
//  GitHubApp
//
//  Created by clarice aragao on 10/09/22.
//

import Foundation
import UIKit

class RepositoryCellView: UITableViewCell, ViewConfiguration {
   
    static let cellIdentifier = "ListViewCellIdentifier"
    
    private var repositoryName: UILabel = {
      
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 2
        label.textAlignment = .left
        
        return label
    }()
    
    private var userRepositoryName: UILabel = {
      
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.systemGray
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 2
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
     
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    func buildSubviews() {
        accessoryType = .disclosureIndicator
        
        addSubview(stackView)
        stackView.addArrangedSubview(repositoryName)
        stackView.addArrangedSubview(userRepositoryName)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
     
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
        
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
      
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    func configureSubviews() {
        
        self.backgroundColor = .white
    }
    
    func configureConstraints() {
       
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    func updateView(with configuration: RepositoryCellViewConfiguration) {
           repositoryName.text = configuration.name
        userRepositoryName.text = configuration.owner
       }
}
