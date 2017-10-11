import Foundation
import UIKit


extension UIView {
    func addTapGesture(target: Any , action : Selector, tapNumber : Int = 1) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = tapNumber
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
}
protocol StatsPresentable {
    var statsView: StatsView { get set }
    
    func setProductsEvent(handler: (() -> Void)?)
    func setFollowersEvent(handler: (() -> Void)?)
    func setFollowingEvent(handler: (() -> Void)?)
    func setProductsCount(_ count: Int)
    func setFollowersCount(_ count: Int)
    func setFollowingCount(_ count: Int)
}

extension StatsPresentable {
    func setProductsEvent(handler: (() -> Void)?) {
        self.statsView.didTapProductsEvent = handler
    }
    func setFollowersEvent(handler: (() -> Void)?) {
        self.statsView.didTapFollowersEvent = handler
    }
    func setFollowingEvent(handler: (() -> Void)?) {
        self.statsView.didTapFollowingEvent = handler
    }
    
    func setProductsCount(_ count: Int) {
        self.statsView.productsCount = count
    }
    func setFollowersCount(_ count: Int) {
        self.statsView.followersCount = count
    }
    func setFollowingCount(_ count: Int) {
        self.statsView.followingCount = count
    }
}

public class StatsView: UIView {
    
    public var productsCount: Int = 0
    public var followersCount: Int = 0
    public var followingCount: Int = 0
    
    public var didTapProductsEvent: (() -> Void)?
    public var didTapFollowingEvent: (() -> Void)?
    public var didTapFollowersEvent: (() -> Void)?
    
    private lazy var productsStatView: StatView = {
        let statView = StatView()
        //.palette(.darkGrey).typography(.extraSmall(.regular))
        statView.topTitle = NSAttributedString(string: String(productsCount))
        statView.bottomTitle = NSAttributedString(string: "Products")
        statView.didTapEvent = { [weak self] in
            self?.didTapProductsEvent?()
        }
        return statView
    }()
    
    private lazy var followersStatView: StatView = {
        let statView = StatView()
        //.palette(.darkGrey).typography(.extraSmall(.regular))
        statView.topTitle = NSAttributedString(string: String(followersCount))
        statView.bottomTitle = NSAttributedString(string: "Followers")
        statView.didTapEvent = { [weak self] in
            self?.didTapFollowersEvent?()
        }
        return statView
    }()
    
    private lazy var followingStatView: StatView = {
        let statView = StatView()
        statView.topTitle = NSAttributedString(string: String(followingCount))
        statView.bottomTitle = NSAttributedString(string: "Following")
        statView.didTapEvent = { [weak self] in
            self?.didTapFollowingEvent?()
        }
        return statView
    }()
    
    private lazy var statsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.productsStatView, self.followersStatView, self.followingStatView
            ])
        stackView.setContentCompressionResistancePriority(UILayoutPriority.init(rawValue: 1000), for: .horizontal)
        stackView.backgroundColor = UIColor.brown
        stackView.axis = .horizontal
        stackView.distribution = UIStackViewDistribution.fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: - Lifecycle
    public convenience init(){
        self.init(frame: .zero)
        self.setup()
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup(){
                self.backgroundColor = .orange
        self.setupView()
        self.setupAutolayoutConstraints()
    }
    
    private func setupView(){
        self.addSubview(self.statsStackView)
    }
    private func setupAutolayoutConstraints(){
        self.statsStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.statsStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        self.statsStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        self.statsStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
