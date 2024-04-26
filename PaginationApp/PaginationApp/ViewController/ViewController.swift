//
//  ViewController.swift
//  PaginationApp
//
//  Created by localuser on 25/04/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    private var currentPage = 1
    private var itemsPerPage = 10
    private var data = [Post]()
    let nm = NetworkRequestManager()
    let ms = MemorizationService()

    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register( SimpleTableViewCell.self, forCellReuseIdentifier: "SimpleTableViewCell")
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
        fetchInitialData()
    }
    
    func fetchInitialData() {
        nm.fetchApiData { result in
            switch result{
            case .success(let posts):
                self.data = posts
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(_):
                break
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleTableViewCell", for: indexPath) as! SimpleTableViewCell
        cell.lablId.text = String(data[indexPath.row].id)
        cell.lablTitle.text = data[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewcontroller()
        vc.postDetail = ms.addDetailtoCache(item: data[indexPath.row])
        self.present(vc, animated: true) {
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
   
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == data.count  - 1 {
            nm.loadPage { result in
                switch result {
                case .success(let posts):
                    self.data.append(contentsOf: posts)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(_):
                    break
                }
            }
        }
    }

}

