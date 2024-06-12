import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  name: "discourse-avatar-component",

  initialize() {
    withPluginApi("1.34.0", (api) => {
      api.changeWidgetSetting(
        "post-avatar",
        "size",
        settings.topic_avatars_size
      );

      api.registerValueTransformer(
        "header-notifications-avatar-size",
        () => settings.header_avatars_size
      );
    });
  },
};
