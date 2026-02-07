//
//  EventBlueprint.swift
//
//  Created by JechtSh0t on 8/23/22.
//  Copyright © 2022 Brook Street Games. All rights reserved.
//

import SwiftUI

///
/// A blueprint for an event.
///
struct EventBlueprint: Codable, Equatable, Hashable, Identifiable {
    
    // MARK: - Properties -
    
    let id: UUID
    let randomNumberRange: ClosedRange<Int>?
    let text: String
    let type: EventType
    
    var isEnabled: Bool {
        switch type {
        case .single(let frequency): frequency != .off
        case .repeatable(let frequency): frequency != .off
        case .timed(_, let isEnabled): isEnabled
        }
    }
    
    // MARK: - Initializers -
    
    init(
        randomNumberRange: ClosedRange<Int>? = nil,
        text: String,
        type: EventType
    ) {
        self.id = UUID()
        self.randomNumberRange = randomNumberRange
        self.text = text
        self.type = type
    }
}

// MARK: - Packaged Blueprints -

extension EventBlueprint {
    
    static let `default`: [EventBlueprint] = [
        
        // Points
        
        EventBlueprint(
            text: "It's a sick world we're living in with sick people. The leader loses a point.",
            type: .repeatable(.low)
        ),
        EventBlueprint(
            text: "[player] is a lucky, lucky girl. Gain one point.",
            type: .repeatable(.medium)
        ),
        EventBlueprint(
            text: "Oh no kids! It's Turbo Man's arch enemy... [player]. Lose one point.",
            type: .repeatable(.medium)
        ),
        EventBlueprint(
            text: "The doctor said the loser actuallly showed some brain actvity this morning... heh. Gain a point.",
            type: .repeatable(.low)
        ),
        
        // Stalls
        
        EventBlueprint(
            text: "The leader will get a turbo man... eventually. No drinks until the next round.",
            type: .repeatable(.medium)
        ),
        EventBlueprint(
            text: "Can't bench press your way out of this one [player]. No drinks until the next round.",
            type: .repeatable(.medium)
        ),
        
        // Minigames
        
        EventBlueprint(
            text: "[player] and [player] shoot one cup beer pong. The winner is not a pervert.",
            type: .repeatable(.high)
        ),
        EventBlueprint(
            text: "Wow... this... is really cool. [player] and [player] flip cups.",
            type: .repeatable(.high)
        ),
        EventBlueprint(
            text: "Ted is on the roof. [player] and [player] throw quarters to knock his ass off.",
            type: .repeatable(.high)
        ),
        EventBlueprint(
            text: "They have a turbo man at KQRS! [player] and [player] chug off to see who gets the D.O.L.L.",
            type: .repeatable(.medium)
        ),
        EventBlueprint(
            text: "[player] and [player] slap cups. The loser's father gets laid off.",
            type: .repeatable(.high)
        ),
        EventBlueprint(
            text: "Turbo Man... use your jetpack! [player] and [player] speed roll.",
            type: .repeatable(.medium)
        ),
        EventBlueprint(
            randomNumberRange: 1...24,
            text: "What are you Dan Rather? What is this 60 minutes? What are you the question king, huh? Chill [player]. Answer question number [number].",
            type: .repeatable(.high)
        ),
        EventBlueprint(
            text: "[player] is gonna deck your halls, [player]. Wager up to three points in any game.",
            type: .repeatable(.low)
        ),
        
        // Beer Swap
        
        EventBlueprint(
            text: "They got a late delivery of Turbo Man at Toy Works! All players can take a beer from the fridge.",
            type: .repeatable(.low)
        ),
        EventBlueprint(
            text: "He got two! [player] can steal a beer from anybody.",
            type: .repeatable(.medium)
        ),
        EventBlueprint(
            text: "Put that cookie down! Now! [player] must drop their beer for no points.",
            type: .repeatable(.low)
        ),
        EventBlueprint(
            text: "[player] is my number one customer. Take a beer from the fridge.",
            type: .repeatable(.high)
        ),
        EventBlueprint(
            text: "Ted is trying to pull a houdini on Liz. [player] and [player] swap stashes.",
            type: .repeatable(.low)
        ),
        
        // Special
        
        EventBlueprint(
            text: "[player], [player], and [player] form an orderly line, so that an employee can hand you a colored ball to see who gets a point.",
            type: .timed(TimeInterval(28.minutes), false)
        )
    ]
}
