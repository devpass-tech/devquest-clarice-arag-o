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
        super.viewDidLoad()
        
        self.fetchList()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Repositories"
        self.navigationItem.searchController = searchController
         
        self.searchController.searchBar.placeholder = "Type a GitHub user name"
         
        self.loadingView.updateView(with: LoadingViewConfiguration(description: "Searching repositories..."))
    }
    
    private func fetchUser() {
        
        self.service.fetchUser("rdgborges") { user in
            print(user)
        }
    }
    
    private func fetchList() {
        
        self.service.fetchList("rdgborges") { repositories in
           
            print(repositories?.first?.name)
            print(repositories?.first?.owner.avatarUrl)
            print(repositories?.first?.owner.login)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        
        service.fetchList("rdgborges") { result in
            
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
