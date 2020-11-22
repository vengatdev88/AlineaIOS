

import UIKit

class TrendTableViewCell: UITableViewCell {
    
    var containerView: UIView!
    var imgView: UIImageView!
    let trendTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        return label
    }()
    
    let trendSubtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        return label
    }()
    
    let trendPriceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
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
        containerView.backgroundColor = .white
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(containerView)
        self.contentView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -10).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 10).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor , constant: 20).isActive = true
        self.contentView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -20).isActive = true
    

        imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.backgroundColor = .clear
        imgView.image = UIImage(systemName: "p.circle.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        imgView.contentMode = .scaleAspectFill
        self.containerView.addSubview(imgView)
        self.imgView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant:0).isActive = true
        self.imgView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: 0).isActive = true
        self.imgView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.imgView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        trendTitleLabel.backgroundColor = .clear
        self.containerView.addSubview(trendTitleLabel)
        self.trendTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 18).isActive = true
        self.trendTitleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.trendTitleLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor , constant:20).isActive = true
        self.trendTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        
        trendSubtitleLabel.backgroundColor = .clear
        self.containerView.addSubview(trendSubtitleLabel)
        self.trendSubtitleLabel.topAnchor.constraint(equalTo: trendTitleLabel.bottomAnchor, constant: 0).isActive = true
        self.trendSubtitleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.trendSubtitleLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor , constant:20).isActive = true
        self.trendSubtitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        
        self.containerView.addSubview(trendPriceLabel)
        self.trendPriceLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        self.trendPriceLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.trendPriceLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 90).isActive = true
        self.trendPriceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        trendPriceLabel.layer.masksToBounds = true
        trendPriceLabel.layer.cornerRadius = 15
    }
}
