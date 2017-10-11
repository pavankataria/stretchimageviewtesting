import Foundation
import UIKit





public extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        let alphaGC = CGFloat(1.0)
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: alphaGC)
    }
}
public class StatView: UIView {
    
    //MARK: - Properties
    public var topTitle: NSAttributedString {
        didSet {
            self.topLabel.attributedText = topTitle
        }
    }
    public var bottomTitle: NSAttributedString {
        didSet {
            self.bottomLabel.attributedText = bottomTitle
        }
    }
    public var didTapEvent: (() -> Void)?
    
    public var edgeInsets: UIEdgeInsets = UIEdgeInsets(top: Properties.padding, left: Properties.padding, bottom: Properties.padding, right: Properties.padding)
    
    public var labelYPadding: CGFloat = Properties.labelYPadding
    
    //MARK: - Private
    /// Default properties
    private struct Properties {
        static let padding: CGFloat = 5
        static let labelYPadding: CGFloat = 0
        static let topLabelColor: UIColor = UIColor(red: 63/255, green: 63/255, blue: 63/255)
        static let bottomLabelColor: UIColor = UIColor(red: 63/255, green: 63/255, blue: 63/255)
    }
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.textColor = Properties.topLabelColor
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Lifecycle
    public convenience init(){
        self.init(frame: .zero)
    }
    
    public convenience init(tapHandler: @escaping (() -> Void)){
        self.init()
        self.didTapEvent = tapHandler
    }
    
    public override init(frame: CGRect) {
        self.topTitle = NSAttributedString()
        self.bottomTitle = NSAttributedString()
        super.init(frame: frame)
        setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("not implemented yet")
    }
    
    func setup(){
        self.setupViews()
        self.setupAutolayoutConstraints()
    }
    
    func setupViews(){
        self.addSubview(topLabel)
        self.addSubview(bottomLabel)
        self.addTapGesture(target: self, action: #selector(didTapView))
    }
    @objc private func didTapView(){
        self.didTapEvent?()
    }
    
    func setupAutolayoutConstraints(){
        self.topLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.edgeInsets.top).isActive = true
        self.bottomLabel.topAnchor.constraint(equalTo: self.topLabel.bottomAnchor, constant: self.labelYPadding).isActive = true
        self.bottomLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -self.edgeInsets.bottom).isActive = true
//        self.bottomLabel.leftAnchor.constraint(greaterThanOrEqualTo: self.leftAnchor, constant: self.edgeInsets.left).isActive = true
//        self.bottomLabel.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -self.edgeInsets.right).isActive = true
//        self.topLabel.leftAnchor.constraint(greaterThanOrEqualTo: self.leftAnchor, constant: self.edgeInsets.left).isActive = true
//        self.topLabel.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: self.edgeInsets.right).isActive = true
        self.topLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.bottomLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
