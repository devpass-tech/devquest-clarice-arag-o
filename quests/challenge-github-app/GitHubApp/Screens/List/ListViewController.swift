//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {

    private let listView: ListView = {

        let listView = ListView()
        return listView
    }()

    private let loadingView = LoadingView()

    private let emptyView: EmptyView = {
    
        let emptyView = EmptyView()
        return emptyView
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

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Repositories"
        self.navigationItem.searchController = searchController
                
        self.searchController.searchBar.placeholder = "Type a GitHub user name"
                
        self.loadingView.updateView(with: LoadingViewConfiguration(description: "Searching repositories..."))
    }

    override func viewDidAppear(_ animated: Bool) {

        service.fetchList { repositories in
            DispatchQueue.main.async {
                self.listView.updateView(with: [RepositoryCellViewConfiguration(name: "Repository1", owner: "Teste" )])
            }
        }

    }

    override func loadView() {
        self.view = listView
    }
}
