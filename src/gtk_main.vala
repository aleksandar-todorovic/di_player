/* Copyright 2015 Aleksandar Todorović (aleksandar.todorovic@mail.ru)
*
* Nutty is free software: you can redistribute it
* and/or modify it under the terms of the GNU General Public License as
* published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.
*
* Nutty is distributed in the hope that it will be
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
* Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with Nutty. If not, see http://www.gnu.org/licenses/.
*/


int main (string[] args) {
    Gtk.init (ref args);

    // Initializes Gtk.Window
    var window = new Gtk.Window ();
    window.title = "Digitally elementary";
    window.set_border_width (12);
    window.set_position (Gtk.WindowPosition.CENTER);
    window.set_default_size (350, 70);
    window.destroy.connect (() => {
        try {
            Process.spawn_command_line_async ("pkill mplayer");
        } catch (SpawnError e) {
            stdout.printf ("Error: %s\n", e.message);
        };
        Gtk.main_quit();
    });

    // Initializes the headerbar
    var headerbar = new Gtk.HeaderBar ();
    headerbar.title = "Digitally elementary";
    headerbar.subtitle = "addictive electronic music";
    headerbar.set_show_close_button (true);

    var ambience = new Gtk.Button.from_icon_name ("media-playback-start");
    ambience.clicked.connect (() => {
        try {
            Process.spawn_command_line_async ("mplayer http://pub7.di.fm/di_00sclubhits");
        } catch (SpawnError e) {
            stdout.printf ("Error: %s\n", e.message);
        }
    });

    window.add (ambience);

    window.set_titlebar (headerbar);
    window.show_all ();

    Gtk.main ();
    return 0;
}
