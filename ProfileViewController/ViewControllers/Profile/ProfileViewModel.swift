//
//  ProfileViewModel.swift
//  Experimenting
//
//  Created by Pavan Kataria on 10/10/2017.
//  Copyright © 2017 Pavan Kataria. All rights reserved.
//

import Foundation
import UIKit

public class ProfileViewModel {
    
    //MARK: - Private
    //MARK: - Events
    var didUpdate: (() -> Void)?
    
    //MARK: - Properties
    private(set) var dataSource = [GenericDataSourceSection<ItemRepresentable>]() {
        didSet {
            self.didUpdate?()
        }
    }
    
    let cellViewModelTypes: [ItemRepresentable.Type] = [
        GenericDashboardCellViewModel.self,
        UserInfoCellViewModel.self,
        TitleViewCellViewModel.self
    ]
    
    //MARK: - Lifecycle
    public init(){
        self.setupViewModels()
    }
    private func setupViewModels(){
        var sections = [GenericDataSourceSection<ItemRepresentable>]()
      
        let dashboardCellViewModel = self.dashboardCellViewModel()
        let userInfoCellViewModel = self.userInfoCellViewModel()
        let titleCellViewModels: [ItemRepresentable] = [
            userInfoCellViewModel,
            dashboardCellViewModel,
            self.titleCellViewModel(title: "asdl;k fjaskl;f jaklsjfakls;j fklasj fklj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk ashd adjkhasdkajs"),
            self.titleCellViewModel(title: " JKHAS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk ashd adjkhasdkajs"),
            self.titleCellViewModel(title: "lkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk ashd adjkhasdkajs"),
            self.titleCellViewModel(title: "asdl;k fjaskl;k fjaskl;f jaklsjfakls;j fklasj fklj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk as;f jaklsjfakls;j fklasj fklj asklfj aklsjf klasjf;k fjaskl;f jaklsjfakls;j fklasj fklj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk as lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk ashd adjkhasdkajs"),
            self.titleCellViewModel(title: "asdl;k fjaskl;f jaklsjfakls;j fklasj fklj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS K;k fjaskl;f jaklsjfakls;j fklasj fklj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk asHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk ashd adjkhasdkajs"),
            self.titleCellViewModel(title: "asdl;k fjaskl;f jakl;k  ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk assjfakls;j fklasj fklj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk ashd adjkhasdkajs"),
            self.titleCellViewModel(title: "asdl;k fjaskl;f jaklsjfakls;j fklasj fklj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk ashd adjkhasdkajs"),
            self.titleCellViewModel(title: "asdl;k fjaskl;f jaklsjfakls;j fklasj fklj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ASHFKLJDSAHF ;k fjaskl;f jaklsjfakls;j fklasj fklj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk as HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk ashd adjkhasdkajs"),
            self.titleCellViewModel(title: "asdl;k fjaskl;f jaklsjfakls;j fklasj fklj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHA;k fjaskl;f jaklsjfakls;j fklasj fklj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk asS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk ashd adjkhasdkajs"),
            self.titleCellViewModel(title: "asdl;k fjaskl;f j;k fjaskl;f jaklsjfakls;j fklasj fklj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk asaklsjfakls;j fklasj fklj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk ashd adjkhasdkajs"),
            self.titleCellViewModel(title: "asdl;k fjaskl;k fjaskl;f jaklsjfakls;j fklasj fklj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk as;k fjaskl;f jaklsjfakls;j fklasj fklj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk as;f jaklsjfakls;j fklasj fklj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ;k fjaskl;f jaklsjfakls;j fklasj fklj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk asASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk ashd adjkhasdkajs"),
            self.titleCellViewModel(title: "asdl;k fjalj asklfj aklsjf klasjf lkasjfkladjs fkldj salkfj daslkfj; asdklfj klsadjdfkld;ash f gkldjfg aJHKSAJDGADHSF JKHAS KHADSFK ASHFKLJDSAHF ADSF HJSTAFK N KAgdkhadhkhh jkashd jklh jkhdjsakhdjk ashd adjkhasdkajs")
        ]
        let sectionOne = GenericDataSourceSection<ItemRepresentable>(items:
//            userInfoCellViewModel,
//            dashboardCellViewModel
            titleCellViewModels
            , supplementaryItems: nil)
        sections.append(sectionOne)
        self.dataSource = sections
    }
}

//MARK: - Cell View Models Setup
extension ProfileViewModel {

    public func userInfoCellViewModel() -> UserInfoCellViewModel {
        let cellViewModel = UserInfoCellViewModel()
        return cellViewModel
    }
    public func dashboardCellViewModel() -> GenericDashboardCellViewModel {
        let cellViewModel = GenericDashboardCellViewModel()
        return cellViewModel
    }
    public func titleCellViewModel(title: String) -> TitleViewCellViewModel {
        return TitleViewCellViewModel(title: title)
    }
}

