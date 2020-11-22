
import UIKit

class ThemeItemCollectionViewCell: UICollectionViewCell {
    
    var imgView: UIImageView!
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        let containerView = UIView()
        containerView.backgroundColor = .bgColor
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(containerView)
        self.contentView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant:0).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor , constant: 0).isActive = true
        self.contentView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        containerView.layer.cornerRadius =  12
        containerView.layer.borderColor =  UIColor(red: 242/255, green: 244/255, blue: 250/255, alpha: 1.0).cgColor
        containerView.layer.borderWidth = 1
        
        imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        containerView.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        self.imgView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        self.imgView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        self.imgView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        self.imgView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        self.contentView.addSubview(label)
        self.label.topAnchor.constraint(equalTo: self.imgView.bottomAnchor).isActive = true
        self.label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        self.label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -20).isActive = true
        self.label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 20).isActive = true
    }
}
