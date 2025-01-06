import HeaderPostersCell from "discourse/components/topic-list/header/posters-cell";
import avatar from "discourse/helpers/avatar";
import { withPluginApi } from "discourse/lib/plugin-api";

const ItemCell = <template>
  <td
    class="posters topic-list-data theme-avatar-{{settings.latest_avatar_size}}"
  >
    {{#each @topic.featuredUsers as |poster|}}
      {{#if poster.moreCount}}
        <a class="posters-more-count">{{poster.moreCount}}</a>
      {{else}}
        <a
          href={{poster.user.path}}
          data-user-card={{poster.user.username}}
          class={{poster.extraClasses}}
        >{{avatar
            poster
            avatarTemplatePath="user.avatar_template"
            usernamePath="user.username"
            namePath="user.name"
            imageSize=settings.latest_avatar_size
          }}</a>
      {{/if}}
    {{/each}}
  </td>
</template>;

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

      api.registerValueTransformer(
        "topic-list-columns",
        ({ value: columns }) => {
          columns.replace("posters", {
            header: HeaderPostersCell,
            item: ItemCell,
          });

          return columns;
        }
      );
    });
  },
};
