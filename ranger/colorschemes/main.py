from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class base(ColorScheme):
    progress_bar_color = 1

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                fg = 18                      # Empty directories
                attr |= bold
            if context.border:
                fg = 17                     # Seperator borders around file columns
            if context.image:
                fg = 18                     # Color of image file names
            if context.video:
                fg = 18                     # Color of video file names
            if context.audio:
                fg = 19                     # Color of audio file names
                attr |= bold
            if context.document:
                fg = 18                     # Color of document files
            if context.container:
                attr |= bold
                fg = 0                      # No idea what this is
            if context.directory:
                fg = 17                     # Color of directories
                attr |= bold
            elif context.executable and not \
                    any((context.media, context.container,
                       context.fifo, context.socket)):
                attr |= bold
                fg = 20                     # Color of scripts
            if context.socket:
                fg = 3                      # Color of sockets (mostly in /bin, etc.)
                attr |= bold
            if context.fifo or context.device:
                fg = 10                     # No idea what this is either
                if context.device:
                    attr |= bold
            if context.link:
                fg = 17                     # Color of symlinks (see ~/writing, etc.)
                attr |= bold
            if context.bad:
                fg = 1
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (7, 8):
                    fg = 1
                else:
                    fg = 1
            if not context.selected and (context.cut or context.copied):
                fg = 15
                bg = 8
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = 8
            if context.badinfo:
                if attr & reverse:
                    bg = 1
                else:
                    fg = 7

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = context.bad and 8 or 7
            elif context.directory:
                fg = 17
            elif context.tab:
                if context.good:
                    fg = 1
            elif context.link:
                fg = 17

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = 17
                elif context.bad:
                    fg = 8
            if context.marked:
                attr |= bold | reverse
                fg = 8
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 10
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = 10
                attr &= ~bold
            if context.vcscommit:
                fg = 5
                attr &= ~bold


        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = 8

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color


        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = 11
            elif context.vcschanged:
                fg = 12
            elif context.vcsunknown:
                fg = 210
            elif context.vcsstaged:
                fg = 216
            elif context.vcssync:
                fg = 113
            elif context.vcsignored:
                fg = 141

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync:
                fg = 12
            elif context.vcsbehind:
                fg = 13
            elif context.vcsahead:
                fg = 9
            elif context.vcsdiverged:
                fg = 10
            elif context.vcsunknown:
                fg = 11

        return fg, bg, attr
