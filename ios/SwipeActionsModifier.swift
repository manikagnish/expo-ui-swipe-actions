import ExpoModulesCore
import SwiftUI

struct SwipeActionsModifier: ViewModifier, Record {
  @Field var leading: [SwipeActionRecord] = []
  @Field var trailing: [SwipeActionRecord] = []
  @Field var allowsFullSwipe: Bool = false

  var eventDispatcher: EventDispatcher?

  init() {}

  init(from params: Dict, appContext: AppContext, eventDispatcher: EventDispatcher) throws {
    try self = .init(from: params, appContext: appContext)
    self.eventDispatcher = eventDispatcher
  }

  func body(content: Content) -> some View {
    content
      .swipeActions(edge: .trailing, allowsFullSwipe: allowsFullSwipe) {
        ForEach(trailing, id: \.id) { action in
          actionButton(action)
        }
      }
      .swipeActions(edge: .leading, allowsFullSwipe: allowsFullSwipe) {
        ForEach(leading, id: \.id) { action in
          actionButton(action)
        }
      }
  }

  @ViewBuilder
  private func actionButton(_ action: SwipeActionRecord) -> some View {
    let role: ButtonRole? = {
      switch action.role {
      case "destructive": return .destructive
      case "cancel":      return .cancel
      default:            return nil
      }
    }()
    Button(role: role) {
      eventDispatcher?(["swipeActions": ["id": action.id]])
    } label: {
      if let icon = action.systemImage {
        Label(action.label, systemImage: icon)
      } else {
        Text(action.label)
      }
    }
    .tint(action.tint)
  }
}
