//
//  EventView.swift
//
//  Created by JechtSh0t on 8/23/22.
//  Copyright © 2022 Brook Street Games. All rights reserved.
//

import AVKit
import SwiftUI

///
/// A view for displaying a round of events.
///
struct EventView: View {
    
    // MARK: - Properties -

    let viewModel: EventViewModel
    
    // MARK: - UI -
    
    var body: some View {
        VStack(spacing: 24) {
            titleView
                .foregroundColor(.text)
            videoView
            eventTextView
            Spacer()
            nextButton
                .foregroundColor(.text)
        }
        .padding(24)
        .screenBackground()
        .onAppear(perform: viewModel.screenAppeared)
    }
}

// MARK: - Subviews -

extension EventView {
    
    private var titleView: some View {
        Text(viewModel.titleText)
            .font(.custom("Lexend", size: 32))
            .bold()
    }
    
    private var videoView: some View {
        VideoPlayer(player: viewModel.videoPlayer)
            .aspectRatio(752/416, contentMode: .fit)
            .cornerRadius(24)
            .onDisappear {
                viewModel.videoPlayer.pause()
            }
    }
    
    private var eventTextView: some View {
        viewModel.eventText
            .font(.custom("Lexend", size: 20))
            .multilineTextAlignment(.center)
    }
    
    private var nextButton: some View {
        Button(action: {
            viewModel.buttonSelected()
        }, label: {
            Text(viewModel.buttonText)
                .font(.custom("Lexend", size: 32))
                .bold()
        })
    }
}

// MARK: - Previews -

#Preview("Intro") {
    let viewModel = EventViewModel(
        events: [
            Event(blueprint: EventBlueprint.default[0], availablePlayers: [])
        ],
        audioService: AudioServiceMock(),
        configurationService: ConfigurationServiceMock(),
        coordinator: nil
    )
    EventView(viewModel: viewModel)
}

#Preview("Event") {
    let viewModel = EventViewModel(
        events: [
            Event(blueprint: EventBlueprint.default[1], availablePlayers: ["Howard"])
        ],
        audioService: AudioServiceMock(),
        configurationService: ConfigurationServiceMock(),
        coordinator: nil
    )
    viewModel.buttonSelected()
    return EventView(viewModel: viewModel)
}
