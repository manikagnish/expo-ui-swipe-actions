import ExpoModulesCore
import ExpoUI

public class SwipeActionsModule: Module {
  public func definition() -> ModuleDefinition {
    Name("SwipeActions")

    OnCreate {
      ViewModifierRegistry.register("swipeActions") { params, appContext, eventDispatcher in
        try SwipeActionsModifier(
          from: params,
          appContext: appContext,
          eventDispatcher: eventDispatcher
        )
      }
    }

    OnDestroy {
      ViewModifierRegistry.unregister("swipeActions")
    }
  }
}
