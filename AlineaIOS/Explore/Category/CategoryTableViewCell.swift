

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    var containerView: UIView!
    var imgView: UIImageView!
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 19.0)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        containerView = UIView()
        containerView.backgroundColor = .selectTabColor
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(containerView)
        self.contentView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -20).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor , constant: 20).isActive = true
        self.contentView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -20).isActive = true
        containerView.layer.cornerRadius =  40
    

        imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.backgroundColor = .clear
        imgView.image = UIImage(systemName: "bitcoinsign.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        imgView.contentMode = .scaleAspectFill
        self.containerView.addSubview(imgView)
        self.imgView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant:0).isActive = true
        self.imgView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: 35).isActive = true
        self.imgView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.imgView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        label.backgroundColor = .clear
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        self.containerView.addSubview(label)
        self.label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        self.label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        self.label.leadingAnchor.constraint(equalTo: imgView.trailingAnchor , constant:20).isActive = true
        self.label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        
    }
}
