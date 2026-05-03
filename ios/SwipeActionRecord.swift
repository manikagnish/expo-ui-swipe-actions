import ExpoModulesCore
import SwiftUI

final class SwipeActionRecord: Record {
  @Field var id: String = ""
  @Field var label: String = ""
  @Field var systemImage: String? = nil
  @Field var tint: Color? = nil           // ExpoModulesCore decodes "#RRGGBB" → Color
  @Field var role: String? = nil          // "destructive" | "cancel" | nil
}