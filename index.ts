import { createModifierWithEventListener } from "@expo/ui/swift-ui/modifiers";

export type SwipeActionRole = "destructive" | "cancel";

export interface SwipeActionConfig {
  id: string;
  label: string;
  systemImage?: string;
  tint?: string;
  role?: SwipeActionRole;
  onPress: () => void;
}

export interface SwipeActionsParams {
  leading?: SwipeActionConfig[];
  trailing?: SwipeActionConfig[];
  allowsFullSwipe?: boolean;
}

export function swipeActions(params: SwipeActionsParams) {
  const handlers = new Map<string, () => void>();
  for (const a of params.leading ?? []) handlers.set(a.id, a.onPress);
  for (const a of params.trailing ?? []) handlers.set(a.id, a.onPress);

  const stripPress = ({ onPress, ...rest }: SwipeActionConfig) => rest;

  return createModifierWithEventListener(
    "swipeActions",
    ({ id }: { id: string }) => handlers.get(id)?.(),
    {
      leading: (params.leading ?? []).map(stripPress),
      trailing: (params.trailing ?? []).map(stripPress),
      allowsFullSwipe: params.allowsFullSwipe ?? false,
    }
  );
}
