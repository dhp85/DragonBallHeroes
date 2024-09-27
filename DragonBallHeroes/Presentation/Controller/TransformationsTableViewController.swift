//
//  TransforamationsTableViewController.swift
//  DragonBallHeroes
//
//  Created by Diego Herreros Parron on 19/9/24.
//

import UIKit

final class TransformationsTableViewController: UITableViewController {
    
    // MARK: Table View Data Source
    
    typealias DataSource = UITableViewDiffableDataSource<Int, Transformation>
    
    
    typealias SnapShot = NSDiffableDataSourceSnapshot<Int, Transformation>
    
    // MARK: - Model
    private let someTransformation: [Transformation]
    private let networkModel: NetworkModel
    private var dataSource: DataSource?
    
    // MARK: - Inizializers
    init(someTransformation : [Transformation],networkModel: NetworkModel = .shared) {
        self.networkModel = networkModel
        self.someTransformation = someTransformation
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   // MARK: - Lifecycle
    
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
        snapshot.appendItems(someTransformation)
        self.dataSource?.apply(snapshot)
            
            }
        }


// MARK: - Table View Delete

extension TransformationsTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100   }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        if let character = dataSource?.itemIdentifier(for: indexPath) {
            let detailViewController = TransformationDetailViewController(transformations: character)
            navigationController?.pushViewController(detailViewController, animated: true)
        }
     }
    
}
