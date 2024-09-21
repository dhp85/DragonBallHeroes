//
//  TransforamationsTableViewController.swift
//  DragonBallHeroes
//
//  Created by Diego Herreros Parron on 19/9/24.
//

import UIKit

final class TransformationsTableViewController: UITableViewController {
    
    // MARK: Table View Data Source
    
    typealias DataSource = UITableViewDiffableDataSource<Int, Transformations>
    
    typealias SnapShot = NSDiffableDataSourceSnapshot<Int, Transformations>
    
    // MARK: Model
    
    private let transformations: [Transformations] = Transformations.allCases
    
    private var dataSource: DataSource?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Transformaciones"
        
        tableView.register(UINib(nibName: TransforamationsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TransforamationsTableViewCell.identifier)
        
        dataSource = DataSource(tableView: tableView) {tableView, indexPath, transformation in
        
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TransforamationsTableViewCell.identifier, for: indexPath) as? TransforamationsTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: transformation)
            return cell
        }
        tableView.dataSource = dataSource
        var snapshot = SnapShot()
        snapshot.appendSections([0])
        snapshot.appendItems(transformations)
        dataSource?.apply(snapshot)

    }

    
}

// MARK: - Table View Delete

extension TransformationsTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let transformation = transformations[indexPath.row]
        let detailtransformationViewController = TransformationDetailViewController(transformations: transformation)
     navigationController?.show(detailtransformationViewController, sender: self)
     }
    
}
