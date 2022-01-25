//
//  ViewController.swift
//  ShoppingDemo
//
//  Created by 罗诗朋 on 2022/1/21.
//

import UIKit
import MJRefresh
class ProductListVC: UIViewController {
    
    var list: [Product] = []
    private var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        // tableView 列表
        tableView = UITableView()
        tableView.rowHeight = 110
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // 注册列表Item
        tableView.register(ProductListCell.self, forCellReuseIdentifier: ProductListCell.description())
        tableView.dataSource = self
        tableView.delegate = self
        // 将tableView添加到视图中
        view.addSubview(tableView)
        // 设置TableView约束
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        // 给 tableView添加下拉刷新。
        let header = MJRefreshNormalHeader{
            self.refreshData()
        }
        header.lastUpdatedTimeLabel?.isHidden = true
        header.stateLabel?.isHidden = true
        tableView.mj_header = header
        // 默认加载数据
        tableView.mj_header?.beginRefreshing()
        
    }
    func refreshData(){
        NetworkAPI.homeProductList{ result in
                                   
          self.tableView.mj_header?.endRefreshing()
            
          switch result {
            
          case let .success(list):
              self.list = list
              self.tableView.reloadData()
          case let .failure(error):print("Failure: \(error.localizedDescription)")
            
            
        }
                                   
        }
        
    }

}

extension ProductListVC: UITableViewDataSource {
    // 设置数据条数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 每个商品数据
        let product = list[indexPath.row]
        // 取出每个Item实例,对应每个Item 绑定数据
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductListCell.description(),for: indexPath)
        as! ProductListCell
        cell.setCover("")
        cell.setName(product.name)
        cell.setRating(product.rating)
        cell.setPrice(product.price)
        cell.setCollect(true)
       
        
        return cell
    }
    
}

extension ProductListVC: UITableViewDelegate {
    
    
}
