//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController, UISearchBarDelegate {
    
    private let listView: ListView = {

        let listView = ListView()
        return listView
    }()

    private let service = Service()
    
    private let searchController = UISearchController()

    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Repositories"
        navigationItem.searchController = searchController
        
        searchController.searchBar.placeholder = "Type a GitHub user name"
        searchController.searchBar.delegate = self
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchController.searchBar.text else {
            return
        }

        service.fetchList(text) { result in
            guard let result = result else {
                return
            }

            let configurations = result.map { RepositoryCellViewConfiguration(name: $0.name,
                                                                              owner: $0.owner.login) }
            DispatchQueue.main.async {
                self.listView.updateView(with: configurations)
            }
        }
    }

    override func loadView() {
        self.view = listView
    }
}
