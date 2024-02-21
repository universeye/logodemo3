//
//  SwitchAnimationView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/1/8.
//
import SwiftUI

enum ViewState {
    case case1, case2, case3

    var view: some View {
        switch self {
        case .case1:
            return AnyView(Text("View for Case 1").font(.title).foregroundColor(.blue))
        case .case2:
            return AnyView(Image(systemName: "star.fill").font(.system(size: 50)).foregroundColor(.yellow))
        case .case3:
            return AnyView(Rectangle().fill(Color.green).frame(width: 100, height: 100))
        }
    }

    var transition: AnyTransition {
        switch self {
        case .case1: return .opacity
        case .case2: return .scale
        case .case3: return .slide
        }
    }
}

struct SwitchAnimationView: View {
    @State private var currentViewState: ViewState = .case1

    var body: some View {
        VStack {
            Picker("Select View State", selection: $currentViewState) {
                Text("Case 1").tag(ViewState.case1)
                Text("Case 2").tag(ViewState.case2)
                Text("Case 3").tag(ViewState.case3)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            currentViewState.view
                .frame(height: 150)
                .padding()
                .transition(currentViewState.transition)
                .animation(.easeInOut,value: currentViewState)
        }
    }
}

struct SwitchAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchAnimationView()
    }
}
