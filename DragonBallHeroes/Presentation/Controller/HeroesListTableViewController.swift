//
//  HeroesListTableViewController.swift
//  DragonBallHeroes
//
//  Created by Diego Herreros Parron on 16/9/24.
//

import UIKit

final class HeroesListTableViewController: UITableViewController {
    
    // MARK: - Table View Data Source
    
    typealias DataSource = UITableViewDiffableDataSource<Int, DragonBallCharacter>
    typealias SnapShot = NSDiffableDataSourceSnapshot<Int, DragonBallCharacter>
    
    //MARK: - Model
    
    private let networkModel: NetworkModel
    private var dataSource: DataSource?
    
    //MARK: - Inizializers
    init(networkModel: NetworkModel = .shared) {
        self.networkModel = networkModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Heroes"
        
        tableView.register(UINib(nibName: HeroesTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HeroesTableViewCell.identifier)
        
        dataSource = DataSource(tableView: tableView) {tableView, indexPath, character in
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeroesTableViewCell.identifier, for: indexPath) as?
                    HeroesTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: character)
            return cell
        }
        tableView.dataSource = dataSource
        var snapshot = SnapShot()
        snapshot.appendSections([0])
        
        networkModel.getHeroes { [weak self] result in
            switch result {
            case let .success(characters):
                snapshot.appendItems(characters)
                self?.dataSource?.apply(snapshot)
            case .failure:
                break
            }
        }
        
        
        
    }
    
}

// MARK: - Table View Delegate

extension HeroesListTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        if let character = dataSource?.itemIdentifier(for: indexPath) {
            let detailViewController = HeroeDetailViewController(heroe: character)
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
}
