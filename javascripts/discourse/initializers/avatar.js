import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  name: "discourse-avatar-component",

  initialize() {
    withPluginApi("0.8.0", (api) => {
      api.changeWidgetSetting(
        "post-avatar",
        "size",
        settings.topic_avatars_size
      );

      api.modifyClass("component:header/user-dropdown/notifications", {
        pluginId: "discourse-avatar-component",
        get avatarSize() {
          return settings.header_avatars_size;
        },
      });
    });
  },
};
