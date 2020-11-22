

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "CategoryTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.contentInset =  UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)

        tableView.tableFooterView = UIView()
        self.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor , constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
    }
}


extension CategoryCollectionViewCell : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell else {fatalError("Unable to load")}
        
        if indexPath.row == 0 {
            cell.containerView.backgroundColor = .stocksColor
            cell.label.text = "Stocks"
        } else if indexPath.row == 1 {
            cell.containerView.backgroundColor = .selectTabColor
            cell.label.text = "ETFs"
        } else {
            cell.separatorInset = UIEdgeInsets(top: 0, left: CGFloat.greatestFiniteMagnitude, bottom: 0, right: 0)
            cell.containerView.backgroundColor = .cryptoColor
            cell.label.text = "Crypto"
        }
        return cell
    }
}
