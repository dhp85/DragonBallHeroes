//
//  HeroesListTableViewController.swift
//  DragonBallHeroes
//
//  Created by Diego Herreros Parron on 16/9/24.
//

import UIKit

final class HeroesListTableViewController: UITableViewController {
    
    // MARK: Table View Data Source
    
    typealias DataSource = UITableViewDiffableDataSource<Int, Heroe>
    typealias SnapShot = NSDiffableDataSourceSnapshot<Int, Heroe>
    
    //MARK: Model
    
    private let heroes: [Heroe] = Heroe.allCases
    
    private var dataSource: DataSource?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Heroes"
        
        tableView.register(UINib(nibName: HeroesTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HeroesTableViewCell.identifier)
        
        dataSource = DataSource(tableView: tableView) {tableView, indexPath, heroe in
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeroesTableViewCell.identifier, for: indexPath) as?
                    HeroesTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: heroe)
            return cell
        }
        tableView.dataSource = dataSource
        var snapshot = SnapShot()
        snapshot.appendSections([0])
        snapshot.appendItems(heroes)
        dataSource?.apply(snapshot)
        
    }
    
}

// MARK: - Table View Delegate

extension HeroesListTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let heroe = heroes[indexPath.row]
        let detailViewController = HeroeDetailViewController(heroe: heroe)
        navigationController?.show(detailViewController, sender: self)
    }
}
