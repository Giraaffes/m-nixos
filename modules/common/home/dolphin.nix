{ ... }:
{
  xdg.dataFile."kxmlgui5/dolphin/dolphinui.rc" = {
    text = ''
      <!DOCTYPE gui>
      <gui name="dolphin" translationDomain="kxmlgui6" version="48">
        <MenuBar alreadyVisited="1">
          <Menu alreadyVisited="1" name="file" noMerge="1">
          <text translationDomain="kxmlgui6">&amp;File</text>
          <Action name="file_new"/>
          <Separator weakSeparator="1"/>
          <Action name="new_menu"/>
          <Action name="file_new"/>
          <Action name="new_tab"/>
          <Action name="file_close"/>
          <Action name="undo_close_tab"/>
          <Separator/>
          <Action name="add_to_places"/>
          <Separator/>
          <Action name="renamefile"/>
          <Action name="duplicate"/>
          <Action name="movetotrash"/>
          <Action name="deletefile"/>
          <Separator/>
          <Action name="show_target"/>
          <Separator/>
          <Action name="properties"/>
          <Separator weakSeparator="1"/>
          <Action name="file_close"/>
          <Separator weakSeparator="1"/>
          <Action name="file_quit"/>
          </Menu>
          <Menu alreadyVisited="1" name="edit" noMerge="1">
          <text translationDomain="kxmlgui6">&amp;Edit</text>
          <Action name="edit_undo"/>
          <Action name="edit_redo"/>
          <Separator weakSeparator="1"/>
          <Action name="edit_cut"/>
          <Action name="edit_copy"/>
          <Action name="edit_paste"/>
          <Separator weakSeparator="1"/>
          <Action name="edit_select_all"/>
          <Separator weakSeparator="1"/>
          <Action name="edit_find"/>
          <Separator weakSeparator="1"/>
          <Action name="edit_cut"/>
          <Action name="edit_copy"/>
          <Action name="copy_location"/>
          <Action name="edit_paste"/>
          <Separator/>
          <Action name="show_filter_bar"/>
          <Action name="edit_find"/>
          <Separator/>
          <Action name="toggle_selection_mode"/>
          <Action name="copy_to_inactive_split_view"/>
          <Action name="move_to_inactive_split_view"/>
          <Action name="edit_select_all"/>
          <Action name="invert_selection"/>
          </Menu>
          <Menu alreadyVisited="1" name="view" noMerge="1">
          <text translationDomain="kxmlgui6">&amp;View</text>
          <Action name="view_zoom_in"/>
          <Action name="view_zoom_out"/>
          <Separator weakSeparator="1"/>
          <Action name="view_redisplay"/>
          <Separator weakSeparator="1"/>
          <Action name="view_zoom_in"/>
          <Action name="view_zoom_reset"/>
          <Action name="view_zoom_out"/>
          <Separator/>
          <Action name="sort"/>
          <Action name="view_mode"/>
          <Action name="additional_info"/>
          <Action name="show_preview"/>
          <Action name="show_in_groups"/>
          <Action name="show_hidden_files"/>
          <Action name="act_as_admin"/>
          <Separator/>
          <Action name="split_view_menu"/>
          <Action name="popout_split_view"/>
          <Action name="split_stash"/>
          <Action name="redisplay"/>
          <Action name="stop"/>
          <Separator/>
          <Action name="panels"/>
          <Menu icon="edit-select-text" name="location_bar" noMerge="1">
            <text context="@title:menu" translationDomain="dolphin">Location Bar</text>
            <Action name="editable_location"/>
            <Action name="replace_location"/>
          </Menu>
          <Separator/>
          <Action name="view_properties"/>
          </Menu>
          <Menu alreadyVisited="1" name="go" noMerge="1">
          <text translationDomain="kxmlgui6">&amp;Go</text>
          <Action name="go_up"/>
          <Action name="go_back"/>
          <Action name="go_forward"/>
          <Action name="go_home"/>
          <Separator weakSeparator="1"/>
          <Action name="bookmarks"/>
          <Action name="closed_tabs"/>
          </Menu>
          <Separator weakSeparator="1"/>
          <Separator weakSeparator="1"/>
          <Separator weakSeparator="1"/>
          <Menu alreadyVisited="1" name="tools" noMerge="1">
          <text translationDomain="kxmlgui6">&amp;Tools</text>
          <Action name="open_preferred_search_tool"/>
          <Action name="open_terminal"/>
          <Action name="open_terminal_here"/>
          <Action name="manage_disk_space"/>
          <Action name="compare_files"/>
          <Action name="change_remote_encoding"/>
          </Menu>
          <Menu alreadyVisited="1" name="settings" noMerge="1">
          <text translationDomain="kxmlgui6">&amp;Settings</text>
          <Action name="window_color_sheme"/>
          <Separator weakSeparator="1"/>
          <Action name="options_show_menubar"/>
          <Merge name="StandardToolBarMenuHandler"/>
          <Merge name="KMDIViewActions"/>
          <Separator weakSeparator="1"/>
          <Action name="switch_application_language"/>
          <Action name="options_configure_keybinding"/>
          <Action name="options_configure_toolbars"/>
          <Action name="options_configure"/>
          </Menu>
          <Separator weakSeparator="1"/>
          <Menu alreadyVisited="1" name="help" noMerge="1">
          <text translationDomain="kxmlgui6">&amp;Help</text>
          <Action name="help_contents"/>
          <Action name="help_whats_this"/>
          <Action name="open_kcommand_bar"/>
          <Separator weakSeparator="1"/>
          <Action name="help_report_bug"/>
          <Separator weakSeparator="1"/>
          <Action name="help_donate"/>
          <Separator weakSeparator="1"/>
          <Action name="help_about_app"/>
          <Action name="help_about_kde"/>
          </Menu>
        </MenuBar>
        <ToolBar alreadyVisited="1" name="mainToolBar" noMerge="1">
          <Action name="go_back"/>
          <Action name="go_forward"/>
          <Action name="go_up"/>
          <text context="@title:menu" translationDomain="dolphin">Main Toolbar</text>
          <Action name="url_navigators"/>
          <Action name="view_redisplay"/>
          <Action name="toggle_search"/>
          <Action name="show_terminal_panel"/>
          <Action name="show_hidden_files"/>
        </ToolBar>
        <State name="new_file">
          <disable>
          <Action name="edit_undo"/>
          <Action name="edit_redo"/>
          <Action name="edit_cut"/>
          <Action name="renamefile"/>
          <Action name="movetotrash"/>
          <Action name="deletefile"/>
          <Action name="invert_selection"/>
          <Separator/>
          <Action name="go_back"/>
          <Action name="go_forward"/>
          </disable>
        </State>
        <State name="has_selection">
          <enable>
          <Action name="invert_selection"/>
          </enable>
        </State>
        <State name="has_no_selection">
          <disable>
          <Action name="delete_shortcut"/>
          <Action name="invert_selection"/>
          </disable>
        </State>
        <ActionProperties scheme="Default">
          <Action name="go_back" priority="0"/>
          <Action name="go_forward" priority="0"/>
          <Action name="go_up" priority="0"/>
          <Action name="go_home" priority="0"/>
          <Action name="stop" priority="0"/>
          <Action name="icons" priority="0"/>
          <Action name="compact" priority="0"/>
          <Action name="details" priority="0"/>
          <Action name="view_mode" priority="0"/>
          <Action name="view_settings" priority="0"/>
          <Action name="view_zoom_in" priority="0"/>
          <Action name="view_zoom_reset" priority="0"/>
          <Action name="view_zoom_out" priority="0"/>
          <Action name="edit_cut" priority="0"/>
          <Action name="edit_copy" priority="0"/>
          <Action name="edit_paste" priority="0"/>
          <Action name="toggle_search" priority="0"/>
          <Action name="toggle_filter" priority="0"/>
        </ActionProperties>
      </gui>
    '';
    force = true;
  };


  xdg.dataFile."user-places.xbel" = {
    text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE xbel>
      <xbel xmlns:bookmark="http://www.freedesktop.org/standards/desktop-bookmarks" xmlns:kdepriv="http://www.kde.org/kdepriv" xmlns:mime="http://www.freedesktop.org/standards/shared-mime-info">
      <info>
        <metadata owner="http://www.kde.org">
        <kde_places_version>4</kde_places_version>
        <GroupState-Places-IsHidden>false</GroupState-Places-IsHidden>
        <GroupState-Remote-IsHidden>true</GroupState-Remote-IsHidden>
        <GroupState-Devices-IsHidden>false</GroupState-Devices-IsHidden>
        <GroupState-RemovableDevices-IsHidden>false</GroupState-RemovableDevices-IsHidden>
        <GroupState-Tags-IsHidden>false</GroupState-Tags-IsHidden>
        <withRecentlyUsed>true</withRecentlyUsed>
        <GroupState-RecentlySaved-IsHidden>true</GroupState-RecentlySaved-IsHidden>
        <withBaloo>true</withBaloo>
        <GroupState-SearchFor-IsHidden>false</GroupState-SearchFor-IsHidden>
        </metadata>
      </info>
      <bookmark href="file:///home/marcus">
        <title>Home</title>
        <info>
        <metadata owner="http://freedesktop.org">
          <bookmark:icon name="user-home"/>
        </metadata>
        <metadata owner="http://www.kde.org">
          <ID>1768046778/0</ID>
          <isSystemItem>true</isSystemItem>
        </metadata>
        </info>
      </bookmark>
      <bookmark href="file:///home/marcus/Skrivebord">
        <title>Desktop</title>
        <info>
        <metadata owner="http://freedesktop.org">
          <bookmark:icon name="user-desktop"/>
        </metadata>
        <metadata owner="http://www.kde.org">
          <ID>1768046778/1</ID>
          <isSystemItem>true</isSystemItem>
        </metadata>
        </info>
      </bookmark>
      <bookmark href="file:///home/marcus/Dokumenter">
        <title>Documents</title>
        <info>
        <metadata owner="http://freedesktop.org">
          <bookmark:icon name="folder-documents"/>
        </metadata>
        <metadata owner="http://www.kde.org">
          <ID>1768046778/2</ID>
          <isSystemItem>true</isSystemItem>
        </metadata>
        </info>
      </bookmark>
      <bookmark href="file:///home/marcus/Hentet">
        <title>Downloads</title>
        <info>
        <metadata owner="http://freedesktop.org">
          <bookmark:icon name="folder-downloads"/>
        </metadata>
        <metadata owner="http://www.kde.org">
          <ID>1768046778/3</ID>
          <isSystemItem>true</isSystemItem>
        </metadata>
        </info>
      </bookmark>
      <bookmark href="file:///home/marcus/Musik">
        <title>Music</title>
        <info>
        <metadata owner="http://freedesktop.org">
          <bookmark:icon name="folder-music"/>
        </metadata>
        <metadata owner="http://www.kde.org">
          <ID>1768046778/6</ID>
          <isSystemItem>true</isSystemItem>
          <IsHidden>true</IsHidden>
        </metadata>
        </info>
      </bookmark>
      <bookmark href="file:///home/marcus/Billeder">
        <title>Pictures</title>
        <info>
        <metadata owner="http://freedesktop.org">
          <bookmark:icon name="folder-pictures"/>
        </metadata>
        <metadata owner="http://www.kde.org">
          <ID>1768046778/7</ID>
          <isSystemItem>true</isSystemItem>
        </metadata>
        </info>
      </bookmark>
      <bookmark href="file:///home/marcus/Videoklip">
        <title>Videos</title>
        <info>
        <metadata owner="http://freedesktop.org">
          <bookmark:icon name="folder-videos"/>
        </metadata>
        <metadata owner="http://www.kde.org">
          <ID>1768046778/8</ID>
          <isSystemItem>true</isSystemItem>
        </metadata>
        </info>
      </bookmark>
      <bookmark href="remote:/">
        <title>Network</title>
        <info>
        <metadata owner="http://freedesktop.org">
          <bookmark:icon name="folder-network"/>
        </metadata>
        <metadata owner="http://www.kde.org">
          <ID>1768046778/4</ID>
          <isSystemItem>true</isSystemItem>
        </metadata>
        </info>
      </bookmark>
      <bookmark href="trash:/">
        <title>Trash</title>
        <info>
        <metadata owner="http://freedesktop.org">
          <bookmark:icon name="user-trash"/>
        </metadata>
        <metadata owner="http://www.kde.org">
          <ID>1768046778/5</ID>
          <isSystemItem>true</isSystemItem>
        </metadata>
        </info>
      </bookmark>
      <bookmark href="recentlyused:/files">
        <title>Recent Files</title>
        <info>
        <metadata owner="http://freedesktop.org">
          <bookmark:icon name="document-open-recent"/>
        </metadata>
        <metadata owner="http://www.kde.org">
          <ID>1768046778/9</ID>
          <isSystemItem>true</isSystemItem>
        </metadata>
        </info>
      </bookmark>
      <bookmark href="recentlyused:/locations">
        <title>Recent Locations</title>
        <info>
        <metadata owner="http://freedesktop.org">
          <bookmark:icon name="folder-open-recent"/>
        </metadata>
        <metadata owner="http://www.kde.org">
          <ID>1768046778/10</ID>
          <isSystemItem>true</isSystemItem>
        </metadata>
        </info>
      </bookmark>
      <separator>
        <info>
        <metadata owner="http://www.kde.org">
          <UDI>/org/freedesktop/UDisks2/block_devices/sda2</UDI>
          <isSystemItem>true</isSystemItem>
          <uuid>365c062d5c05e887</uuid>
          <IsHidden>true</IsHidden>
        </metadata>
        </info>
      </separator>
      <separator>
        <info>
        <metadata owner="http://www.kde.org">
          <UDI>/org/freedesktop/UDisks2/block_devices/sda3</UDI>
          <isSystemItem>true</isSystemItem>
          <uuid>709abcc9-c7d3-47d2-84b9-4365eea9a1bd</uuid>
        </metadata>
        </info>
      </separator>
      <separator>
        <info>
        <metadata owner="http://www.kde.org">
          <UDI>/org/freedesktop/UDisks2/block_devices/sda4</UDI>
          <isSystemItem>true</isSystemItem>
          <uuid>06797be7-aaa9-42b6-aa7a-c6daf41580ca</uuid>
        </metadata>
        </info>
      </separator>
      <separator>
        <info>
        <metadata owner="http://www.kde.org">
          <UDI>/org/freedesktop/UDisks2/block_devices/sdb2</UDI>
          <isSystemItem>true</isSystemItem>
          <uuid>c272bae572badcfb</uuid>
        </metadata>
        </info>
      </separator>
      <separator>
        <info>
        <metadata owner="http://www.kde.org">
          <UDI>/org/freedesktop/UDisks2/block_devices/sdc1</UDI>
          <isSystemItem>true</isSystemItem>
          <uuid>dcce-3d8d</uuid>
        </metadata>
        </info>
      </separator>
      <separator>
        <info>
        <metadata owner="http://www.kde.org">
          <UDI>/org/freedesktop/UDisks2/block_devices/sdc1</UDI>
          <isSystemItem>true</isSystemItem>
          <uuid>1b2c-b856</uuid>
        </metadata>
        </info>
      </separator>
      </xbel>
    '';
    force = true;
  };
}