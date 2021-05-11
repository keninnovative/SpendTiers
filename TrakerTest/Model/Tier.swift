//
//  Tiers.swift
//  TrakerTest
//
//  Created by Ken Nyame on 5/10/21.
//

import Foundation
struct Tier: Equatable {
    let title: String
    let from: Double
    let to: Double
}

struct Progress {
    let tier: Tier
    let spend: Double
}

var tiers: [Tier] = [Tier(title: "Tier 1", from: 0, to: 5000),
                     Tier(title: "Tier 2", from: 5000, to: 10000),
                     Tier(title: "Tier 3", from: 10000, to: 20000),
                     Tier(title: "Tier 4", from: 20000, to: 30000),
                     Tier(title: "Tier 5", from: 30000, to: 40000),
                     Tier(title: "Tier 6", from: 40000, to: 50000)]
