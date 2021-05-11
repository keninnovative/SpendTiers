//
//  Tiers.swift
//  TrakerTest
//
//  Created by Ken Nyame on 5/10/21.
//

import Foundation
struct Tier: Equatable {
    let from: Double
    let to: Double
}

struct Progress {
    let tier: Tier
    let spend: Double
}

var tiers: [Tier] = [Tier(from: 0, to: 5000),
                     Tier(from: 5000, to: 10000),
                     Tier(from: 10000, to: 20000),
                     Tier(from: 20000, to: 30000),
                     Tier(from: 30000, to: 40000),
                     Tier(from: 40000, to: 50000)]
