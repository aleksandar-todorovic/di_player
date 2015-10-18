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
