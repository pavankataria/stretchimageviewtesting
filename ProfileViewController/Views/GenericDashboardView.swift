import Foundation
import UIKit

//public class OwnerProfileDashboardView: UIView, StatsPresentable {
//    var statsView = StatsView()
//}
//
//public class GenericUserProfileDashboardView: UIView, StatsPresentable {
//    var statsView = StatsView()
//}

public class GenericDashboardView: UIView, StatsPresentable {
    
    //MARK: - Properties
    public lazy var statsView: StatsView = {
        let statsView = StatsView()
        statsView.translatesAutoresizingMaskIntoConstraints = false
        statsView.setContentCompressionResistancePriority(UILayoutPriority.init(rawValue: 100), for: .horizontal)
        return statsView
    }()
    
    public lazy var actionButton: UIButton = {
        let button = UIButton.init(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Following", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        button.contentEdgeInsets = UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10)
        button.setContentHuggingPriority(UILayoutPriority.init(rawValue: 751), for: .horizontal)
        return button
    }()
    
    //MARK: - Events
    public var didTapButtonEvent: (() -> Void)? = nil
    
    //MARK: - Lifecycle
    public convenience init(){
        self.init(frame: .zero)
        self.setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = .magenta
        self.setupViews()
        self.setupConstraints()
    }
    
    private func setupViews(){
        self.addSubview(statsView)
        self.addSubview(actionButton)
        
    }
    @objc private func didTapButton(){
        self.didTapButtonEvent?()
    }
    private func setupConstraints(){
        let padding: CGFloat = 15
        self.statsView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.statsView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        self.statsView.rightAnchor.constraint(equalTo: self.actionButton.leftAnchor).isActive = true
        
        self.actionButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding).isActive = true
        self.actionButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.actionButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        self.bottomAnchor.constraint(equalTo: self.statsView.bottomAnchor).isActive = true
    }
}
